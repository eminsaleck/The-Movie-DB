//
//  UpcomingMovieCellViewModel.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import Foundation
import Domain

protocol UpcomingMovieCellViewModelProtocol {

    var title: String { get }
    var releaseDate: String? { get }
    var posterURL: URL? { get }
    var backdropURL: URL? { get }

}

final class UpcomingMovieCellViewModel: UpcomingMovieCellViewModelProtocol {

    let title: String
    let releaseDate: String?
    let posterURL: URL?
    let backdropURL: URL?

    init(_ movie: Movie) {
        title = movie.title
        releaseDate = movie.releaseDate
        posterURL = movie.posterURL
        backdropURL = movie.backdropURL
    }

}
