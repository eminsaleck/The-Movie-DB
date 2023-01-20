//
//  SearchOptionsSections.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import Foundation
import Common

enum SearchOptionsSection {
    case recentlyVisited, defaultSearches, genres

    var title: String? {
        switch self {
        case .recentlyVisited:
            return LocalizedStrings.recentlyVisitedSeearchSectionTitle()
        case .defaultSearches:
            return nil
        case .genres:
            return LocalizedStrings.movieGenresSearchSectionTitle()
        }
    }

}
