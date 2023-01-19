//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Foundation
import Combine

public protocol NetworkService {
  func request(endpoint: Requestable) -> AnyPublisher<Data, NetworkError>
}

public protocol NetworkSessionManager {
  typealias NetworkingOutput = (data: Data, response: URLResponse)
  func request(_ request: URLRequest) -> AnyPublisher<NetworkingOutput, URLError>
}

public protocol NetworkErrorLogger {
  func log(request: URLRequest)
  func log(responseData data: Data?, response: URLResponse?)
  func log(error: Error)
  func log(responseData data: Data, response: URLResponse)
}
