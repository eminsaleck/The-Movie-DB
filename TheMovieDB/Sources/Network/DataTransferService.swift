//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Foundation
import Combine

public protocol DataTransferService {
  func request<T: Decodable, E: ResponseRequestable>(with endpoint: E)
    -> AnyPublisher<T, DataTransferError> where E.Response == T

  func request<E: ResponseRequestable>(with endpoint: E)
    -> AnyPublisher<Data, DataTransferError> where E.Response == Data
}

public enum DataTransferError: Error {
  case noResponse
  case parsing(Error)
  case networkFailure(NetworkError)
  case resolvedNetworkFailure(Error)
}


public protocol ResponseDecoder {
  func decode<T: Decodable>(_ data: Data) throws -> T
}


public protocol DataTransferErrorResolver {
  func resolve(error: NetworkError) -> Error
}
