//
//  MoviesByGenreInteractor.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import Foundation
import Domain

struct MoviesByGenreInteractor: MoviesInteractorProtocol {

    let movieUseCase: MovieUseCaseProtocol
    let genreId: Int
    let genreName: String

    init(useCaseProvider: UseCaseProviderProtocol, genreId: Int, genreName: String) {
        self.movieUseCase = useCaseProvider.movieUseCase()
        self.genreId = genreId
        self.genreName = genreName
    }

    func getMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        movieUseCase.getMoviesByGenre(page: page, genreId: genreId, completion: completion)
    }

}
