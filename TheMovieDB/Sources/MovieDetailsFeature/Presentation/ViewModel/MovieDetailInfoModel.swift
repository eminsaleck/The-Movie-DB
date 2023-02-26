//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 25.02.2023.
//

import Foundation
import Common

public struct MovieDetailInfoModel {
    var id: Int
    var backDropPath: URL?
    var name: String?
    var releaseDate: String?
    var genre: String?
    var posterPath: URL?
    var overView: String?
    var score: String?
    var maxScore: String = "/10"
    var countVote: String?
    
    public init(movie: MovieDetail) {
        id = movie.id
        backDropPath = movie.backDropPathURL
        name = movie.name
        releaseDate = movie.releaseDate
        genre = movie.genreIds.first?.name
        posterPath = movie.posterPathURL
        overView = movie.overview
        score = String(movie.voteAverage)
        countVote = String(movie.voteCount)
    }
}

