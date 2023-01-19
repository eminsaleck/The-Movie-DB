//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//


import Foundation
import Combine
import Network

public final class NetworkService: NetworkServiceProtocol {

  private let config: NetworkConfigurable
  private let sessionManager: NetworkSessionManagerProtocol

  public init(config: NetworkConfigurable,
              sessionManager: NetworkSessionManagerProtocol = NetworkSessionManager()) {
    self.sessionManager = sessionManager
    self.config = config
  }

  private func resolve(error: Error) -> NetworkError {
    if let networkError = error as? NetworkError {
      return networkError
    } else {
      let code = URLError.Code(rawValue: (error as NSError).code)
      switch code {
      case .notConnectedToInternet: return .notConnected
      case .cancelled: return .cancelled
      default: return .generic(error)
      }
    }
  }

  private func handleResponse(data: Data, response: URLResponse) throws -> Data {
    if let response = response as? HTTPURLResponse {
      if (200...299).contains(response.statusCode) {
        return data
      } else {
        let error = NetworkError.error(statusCode: response.statusCode, data: data)
        throw error
      }
    } else {
      return data
    }
  }

  private func request(request: URLRequest) -> AnyPublisher<Data, NetworkError> {
    let session = sessionManager.request(request)
      .tryMap { (data, response) in
        try self.handleResponse(data: data, response: response)
      }
      .mapError { error -> NetworkError in
        let networkError = self.resolve(error: error)
        return networkError
      }
      .eraseToAnyPublisher()

    return session
  }

  public func request(endpoint: Requestable) -> AnyPublisher<Data, NetworkError> {
    do {
      let urlRequest = try endpoint.urlRequest(with: config)
      return request(request: urlRequest)
    } catch {
      return Fail(error: NetworkError.urlGeneration)
        .eraseToAnyPublisher()
    }
  }
}
