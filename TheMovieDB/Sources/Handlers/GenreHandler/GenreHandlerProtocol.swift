//
//  GenreHandlerProtocol.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 13.11.2022.
//

import Domain

/**
 * Provides methods to access the movie genres names
 * because they are not always sent to us through the endpoints.
 */
protocol GenreHandlerProtocol {

    func setGenres(_ genres: [Genre])
    func getGenreName(for genreId: Int) -> String?

}
