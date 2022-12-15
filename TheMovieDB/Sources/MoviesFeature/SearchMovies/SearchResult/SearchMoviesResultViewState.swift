//
//  SearchMoviesResultViewState.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import Foundation
import UpcomingMoviesDomain

enum SearchMoviesResultViewState {

    case initial
    case empty
    case searching
    case populated([Movie])
    case error(Error)

    var sections: [SearchMoviesResultSections]? {
        switch self {
        case .populated:
            return [.searchedMovies]
        case .initial:
            return [.recentSearches]
        case .searching, .empty, .error:
            return nil
        }
    }

    var currentSearchedMovies: [Movie] {
        switch self {
        case .populated(let entities):
            return entities
        case .initial, .empty, .error, .searching:
            return []
        }
    }

}
