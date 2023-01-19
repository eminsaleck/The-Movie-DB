//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//


import Foundation
import Network
import Combine


public class DefaultNetworkSessionManager: NetworkSessionManager {

  public init() {}

  public func request(_ request: URLRequest) -> AnyPublisher<NetworkingOutput, URLError> {
    return URLSession.shared.dataTaskPublisher(for: request).eraseToAnyPublisher()
  }
}
