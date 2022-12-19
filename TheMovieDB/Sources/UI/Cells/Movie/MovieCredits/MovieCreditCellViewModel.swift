//
//  MovieCreditCellViewModel.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import Foundation
import Domain

protocol MovieCreditCellViewModelProtocol {

    var name: String { get }
    var role: String { get }
    var profileURL: URL? { get }

}

final class MovieCreditCellViewModel: MovieCreditCellViewModelProtocol {

    let name: String
    let role: String
    let profileURL: URL?

    init(cast: Cast) {
        name = cast.name
        role = cast.character
        profileURL = cast.profileURL
    }

    init(crew: Crew) {
        name = crew.name
        role = crew.job
        profileURL = crew.profileURL
    }

}
