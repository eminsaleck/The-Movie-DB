//
//  MovieListCellViewModel.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import Foundation
import Domain

protocol MovieListCellViewModelProtocol {

    var name: String { get }
    var genreName: String? { get }
    var releaseDate: String? { get }
    var posterURL: URL? { get }
    var voteAverage: Double? { get }

}

final class MovieCellViewModel: MovieListCellViewModelProtocol {

    let name: String
    let genreName: String?
    let releaseDate: String?
    let posterURL: URL?
    let voteAverage: Double?

    init(_ movie: Movie) {
        self.name = movie.title
        self.genreName = movie.genreName
        self.releaseDate = movie.releaseDate
        self.voteAverage = movie.voteAverage
        self.posterURL = movie.posterURL
    }

}
