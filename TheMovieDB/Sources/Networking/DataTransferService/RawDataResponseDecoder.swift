//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Foundation
import Network

public class RawDataResponseDecoder: ResponseDecoderProtocol {

  public init() { }

  enum CodingKeys: String, CodingKey {
    case `default` = ""
  }

  public func decode<T: Decodable>(_ data: Data) throws -> T {
    if T.self is Data.Type, let data = data as? T {
      return data
    } else {
      let context = DecodingError.Context(codingPath: [CodingKeys.default], debugDescription: "Expected Data type")
      throw Swift.DecodingError.typeMismatch(T.self, context)
    }
  }
}
