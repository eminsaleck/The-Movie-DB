//
//  CustomListDetailViewState.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 12.12.2022.
//


import Foundation
import Domain

enum CustomListDetailViewState {

    case loading
    case empty
    case populated([Movie])
    case error(Error)

    var currentMovies: [Movie] {
        switch self {
        case .loading, .empty, .error:
            return []
        case .populated(let movies):
            return movies
        }
    }

}
