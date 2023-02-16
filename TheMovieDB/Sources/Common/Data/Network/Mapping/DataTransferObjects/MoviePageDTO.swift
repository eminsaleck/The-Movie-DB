//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 22.01.2023.
//

import Foundation

public struct MoviePageDTO: Decodable {
  public let page: Int
  public let results: [Movie2DTO]
  public let totalPages: Int
  public let totalResults: Int

  enum CodingKeys: String, CodingKey {
    case page
    case results = "results"
    case totalPages = "total_pages"
    case totalResults = "total_results"
  }
}

public struct Movie2DTO: Decodable {
  public let id: Int
  public let name: String
  public let overview: String
  public let posterPath: String?
  public let backDropPath: String?
  public let genreIds: [Int]?
  public let voteAverage: Double
  public let voteCount: Int

  enum CodingKeys: String, CodingKey {
    case id
    case name = "original_title"
    case overview
    case posterPath = "poster_path"
    case backDropPath = "backdrop_path"
    case genreIds = "genre_ids"
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
  }
}
