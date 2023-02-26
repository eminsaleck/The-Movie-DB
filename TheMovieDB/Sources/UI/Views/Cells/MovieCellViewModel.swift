//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 31.01.2023.
//

import Foundation
import Common

public struct MovieCellViewModel: Hashable {
    private let id = UUID().uuidString
    public let movieId: Int
    let name: String
    let average: String
    let posterPathURL: URL?
    
    public init(movie: MoviePage.Movie) {
        movieId = movie.id
        name = movie.name
        average = (movie.voteAverage == 0) ? "0.0": String(movie.voteAverage)
        posterPathURL = movie.posterPath
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: MovieCellViewModel, rhs: MovieCellViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}

