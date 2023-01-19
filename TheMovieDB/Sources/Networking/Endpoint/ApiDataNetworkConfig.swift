//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Foundation
import Network

public struct ApiDataNetworkConfig: NetworkConfigurable {

  public let baseURL: URL

  public let headers: [String: String]

  public let queryParameters: [String: String]

  public init(baseURL: URL,
              headers: [String: String] = [:],
              queryParameters: [String: String] = [:]) {
    self.baseURL = baseURL
    self.headers = headers
    self.queryParameters = queryParameters
  }
}
