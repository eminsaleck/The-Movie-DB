//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 23.01.2023.
//

import Foundation

public struct MovieAccountStatusDTO: Decodable {
  public let showId: Int
  public let isFavorite: Bool
  public let isWatchList: Bool

  enum CodingKeys: String, CodingKey {
    case showId = "id"
    case isFavorite = "favorite"
    case isWatchList = "watchlist"
  }
}
