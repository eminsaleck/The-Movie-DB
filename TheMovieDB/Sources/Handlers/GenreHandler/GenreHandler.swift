//
//  GenreHandler.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 13.11.2022.
//

import Domain

final class GenreHandler: GenreHandlerProtocol {

    private var genres: [Genre] = []

    init() {}

    func setGenres(_ genres: [Genre]) {
        self.genres = genres
    }

    func getGenreName(for genreId: Int) -> String? {
        guard let genre = genres.filter({ $0.id == genreId }).first else { return nil }
        return genre.name
    }

}
