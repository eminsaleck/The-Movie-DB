//
//  SimilarMoviesInteractor.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import Foundation
import UpcomingMoviesDomain

struct SimilarMoviesInteractor: MoviesInteractorProtocol {

    let movieUseCase: MovieUseCaseProtocol
    let movieId: Int

    init(useCaseProvider: UseCaseProviderProtocol, movieId: Int) {
        self.movieUseCase = useCaseProvider.movieUseCase()
        self.movieId = movieId
    }

    func getMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        movieUseCase.getSimilarMovies(page: page, movieId: movieId, completion: completion)
    }

}
