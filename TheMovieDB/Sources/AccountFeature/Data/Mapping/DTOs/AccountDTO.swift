//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.01.2023.
//

import Foundation

public struct AccountDTO: Decodable {
  let id: Int
  let userName: String
  let avatar: AvatarDTO?

  enum CodingKeys: String, CodingKey {
    case avatar
    case id
    case userName = "username"
  }
}

// MARK: - Avatar
public struct AvatarDTO: Decodable {
  let gravatar: GravatarDTO?

  enum CodingKeys: String, CodingKey {
    case gravatar
  }
}

// MARK: - Gravatar
public struct GravatarDTO: Decodable {
  let hash: String?

  enum CodingKeys: String, CodingKey {
    case hash
  }
}
