//
//  SearchOptionsViewState.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import Foundation

enum SearchOptionsViewState {

    case emptyMovieVisits
    case populatedMovieVisits

    var sections: [SearchOptionsSection] {
        switch self {
        case .emptyMovieVisits:
            return [.defaultSearches, .genres]
        case .populatedMovieVisits:
            return [.recentlyVisited, .defaultSearches, .genres]
        }
    }

}
