//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.01.2023.
//

import Foundation

struct NewRequestTokenDTO: Decodable {
  let success: Bool
  let token: String

  enum CodingKeys: String, CodingKey {
    case success
    case token = "request_token"
  }
}
