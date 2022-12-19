//
//  VisitedMovieCellViewModel.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import Foundation
import Domain

protocol VisitedMovieCellViewModelProtocol {

    var posterURL: URL? { get }

}

final class VisitedMovieCellViewModel: VisitedMovieCellViewModelProtocol {

    var posterURL: URL?

    init(movieVisit: MovieVisit) {
        let posterPath = movieVisit.posterPath
        posterURL = URL(string: posterPath)
    }

}
