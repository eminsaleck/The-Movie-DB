//
//  GenreSearchOptionCellViewModel.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import Foundation
import Domain

protocol GenreSearchOptionCellViewModelProtocol {

    var id: Int { get }
    var name: String? { get }

}

final class GenreSearchOptionCellViewModel: GenreSearchOptionCellViewModelProtocol {

    var id: Int
    var name: String?

    init(genre: Genre) {
        id = genre.id
        name = genre.name
    }

}
