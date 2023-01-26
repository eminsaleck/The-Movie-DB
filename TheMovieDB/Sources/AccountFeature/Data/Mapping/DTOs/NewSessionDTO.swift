//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.01.2023.
//

import Foundation

struct NewSessionDTO: Decodable {
  let success: Bool
  let sessionId: String

  enum CodingKeys: String, CodingKey {
    case success
    case sessionId = "session_id"
  }
}
