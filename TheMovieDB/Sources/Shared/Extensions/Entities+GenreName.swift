//
//  Entities+GenreName.swift
//  TheMovieDB
//
//  Created by LEMIN DAHOVICH on 10.11.2022.
//

import Domain

protocol GenreNameable {

    var genreId: Int? { get }
    var genreName: String { get }

}

extension GenreNameable {

    var genreHandler: GenreHandlerProtocol {
        DIContainer.shared.resolve()
    }

    var genreName: String {
        guard let genreId = genreId,
              let genreName = genreHandler.getGenreName(for: genreId) else {
            return "-"
        }
        return genreName
    }

}

extension Movie: GenreNameable {

    var genreId: Int? {
        return genreIds?.first
    }

}
