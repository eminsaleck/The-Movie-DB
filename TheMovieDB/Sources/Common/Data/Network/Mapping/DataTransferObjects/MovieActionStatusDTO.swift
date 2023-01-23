//
//  File 2.swift
//  
//
//  Created by LEMIN DAHOVICH on 23.01.2023.
//

import Foundation

public struct MovieActionStatusDTO: Decodable {
  let code: Int
  let message: String?

  enum CodingKeys: String, CodingKey {
    case code = "status_code"
    case message = "status_message"
  }
}
