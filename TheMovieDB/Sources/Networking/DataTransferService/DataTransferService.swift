//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Foundation
import Combine
import Network

public final class DataTransferService {
    
    private let networkService: NetworkService
    private let errorResolver: DataTransferErrorResolver
    
    public init(with networkService: NetworkService, errorResolver: DataTransferErrorResolver = DataTransferErrorResolver()) {
        self.networkService = networkService
        self.errorResolver = errorResolver
    }
}

extension DataTransferService: DataTransferServiceProtocol {
    
    private func decode<T: Decodable>(data: Data, decoder: ResponseDecoderProtocol) throws -> T {
        do {
            let result: T = try decoder.decode(data)
            return result
        } catch {
            throw DataTransferError.parsing(error)
        }
    }
    
    private func resolve(networkError error: NetworkError) -> DataTransferError {
        let resolvedError = self.errorResolver.resolve(error: error)
        return resolvedError is NetworkError ? .networkFailure(error) : .resolvedNetworkFailure(resolvedError)
    }
    
    public func request<T, E>(with endpoint: E) -> AnyPublisher<T, DataTransferError> where T: Decodable, T == E.Response, E: ResponseRequestable {
        
        return networkService.request(endpoint: endpoint)
            .tryMap { data -> T in
                let result: T = try self.decode(data: data, decoder: endpoint.responseDecoder)
                return result
            }
            .mapError { error -> DataTransferError in
                
                if let networkError = error as? NetworkError {
                    let transferError = self.resolve(networkError: networkError)
                    return transferError
                } else if let transferError = error as? DataTransferError {
                    return transferError
                } else {
                    return DataTransferError.resolvedNetworkFailure(error)
                }
            }
            .eraseToAnyPublisher()
    }
    
    public func request<E>(with endpoint: E) -> AnyPublisher<Data, DataTransferError> where E: ResponseRequestable, E.Response == Data {
        return networkService.request(endpoint: endpoint)
            .mapError { networkError -> DataTransferError in
                let transferError = self.resolve(networkError: networkError)
                return transferError
            }
            .eraseToAnyPublisher()
    }
}
