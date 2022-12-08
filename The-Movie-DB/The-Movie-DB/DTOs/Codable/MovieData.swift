//
//  MovieData.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 16.11.2022.
//

import Foundation

struct MovieData: Codable {
  var results: [Movie]
}

struct Movie: Codable {
  let id: Int
  let original_title: String
  let overview: String
  let poster_path: String?
  let vote_average: Float?
  let vote_count: Int?
  let backdrop_path: String?
  
  
  init(from decoder: Decoder) throws {
    let value = try decoder.container(keyedBy: Movie.CodingKeys.self)
    id = try value.decode(Int.self, forKey: .id)
    original_title = try value.decode(String.self, forKey: .original_title)
    overview = try value.decode(String.self, forKey: .overview)
    poster_path = try value.decodeIfPresent(String?.self, forKey: .poster_path) ?? ""
    vote_average = try value.decodeIfPresent(Float?.self, forKey: .vote_average) ?? 0
    vote_count = try value.decodeIfPresent(Int?.self, forKey: .vote_count) ?? 0
    backdrop_path = try value.decodeIfPresent(String?.self, forKey: .backdrop_path) ?? ""
  }
}
