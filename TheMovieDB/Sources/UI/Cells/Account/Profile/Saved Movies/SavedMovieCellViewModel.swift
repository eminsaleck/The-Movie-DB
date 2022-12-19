//
//  SavedMovieCellViewModel.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import Foundation
import Domain

protocol SavedMovieCellViewModelProtocol {

    var title: String { get }
    var backdropURL: URL? { get }

}

final class SavedMovieCellViewModel: SavedMovieCellViewModelProtocol {

    let title: String
    let backdropURL: URL?

    init(_ favorite: Movie) {
        title = favorite.title
        backdropURL = favorite.backdropURL
    }

}
