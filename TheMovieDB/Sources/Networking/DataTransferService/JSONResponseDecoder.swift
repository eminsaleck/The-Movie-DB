//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Foundation
import Network

public class JSONResponseDecoder: ResponseDecoderProtocol {
  private let jsonDecoder = JSONDecoder()

  public init() { }

  public func decode<T: Decodable>(_ data: Data) throws -> T {
    return try jsonDecoder.decode(T.self, from: data)
  }
}
