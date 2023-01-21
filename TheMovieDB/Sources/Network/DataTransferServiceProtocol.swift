//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Foundation
import Combine

public protocol DataTransferServiceProtocol {
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


public protocol ResponseDecoderProtocol {
  func decode<T: Decodable>(_ data: Data) throws -> T
}


public protocol DataTransferErrorResolverProtocol {
  func resolve(error: NetworkError) -> Error
}
