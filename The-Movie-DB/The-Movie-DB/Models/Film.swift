//
//  Film.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.10.2022.
//

import Foundation

struct Film: Codable, Hashable {
    var adult: Bool
    var backdropPath: String
    var genreIDS: [Int]
    var id: Int
    var originalLanguage: OriginalLanguage
    var originalTitle, overview: String
    var popularity: Double
    var posterPath, releaseDate, title: String
    var video: Bool
    var voteAverage: Double
    var voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    subscript(index: Int) -> Int {
        get {
          return index
        }
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case fr = "fr"
    case ja = "ja"
}

extension Film: Displayable {
    var poster: String {
        posterPath
    }
    
    var review: String {
        overview
    }
    
    var titleName: String {
        title
    }
    
    var rating: Double {
        voteAverage
    }
    
}
