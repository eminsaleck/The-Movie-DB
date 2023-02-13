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
    private let showId: Int
    let name: String
    let average: String
    let posterPathURL: URL?
    
    public init(show: MoviePage.Movie) {
        showId = show.id
        name = show.name
        average = (show.voteAverage == 0) ? "0.0": String(show.voteAverage)
        posterPathURL = show.posterPath
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: MovieCellViewModel, rhs: MovieCellViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}

