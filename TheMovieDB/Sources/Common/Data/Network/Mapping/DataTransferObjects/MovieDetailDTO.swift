//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.02.2023.
//

import Foundation

public struct MovieDetailDTO: Decodable {

  public let id: Int
  public let name: String
  public let releaseDate: String?

  public let genreIds: [GenreDTO]?

  public var posterPath: String?
  public var backDropPath: String?
  public let overview: String?
  public let voteAverage: Double?
  public let voteCount: Int?


  enum CodingKeys: String, CodingKey {
    case id
    case name = "title"
    case releaseDate = "release_date"
    case genreIds = "genres"
    case posterPath = "poster_path"
    case backDropPath = "backdrop_path"
    case overview

    case voteAverage = "vote_average"
    case voteCount = "vote_count"

  }
}
