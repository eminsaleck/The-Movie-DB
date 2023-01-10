//
//  PopularMoviesInteractor.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import Foundation
import Domain

struct PopularMoviesInteractor: MoviesInteractorProtocol {

    let movieUseCase: MovieUseCaseProtocol

    init(useCaseProvider: UseCaseProviderProtocol) {
        self.movieUseCase = useCaseProvider.movieUseCase()
    }

    func getMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        movieUseCase.getPopularMovies(page: page, completion: completion)
    }

}
