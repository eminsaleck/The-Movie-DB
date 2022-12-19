//
//  RecentlyVisitedMoviesCellViewModel.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import Foundation

protocol RecentlyVisitedMoviesCellViewModelProtocol {

    var visitedMovieCells: [VisitedMovieCellViewModelProtocol] { get }

}

final class RecentlyVisitedMoviesCellViewModel: RecentlyVisitedMoviesCellViewModelProtocol {

    var visitedMovieCells: [VisitedMovieCellViewModelProtocol]

    init(visitedMovieCells: [VisitedMovieCellViewModelProtocol]) {
        self.visitedMovieCells = visitedMovieCells
    }

}
