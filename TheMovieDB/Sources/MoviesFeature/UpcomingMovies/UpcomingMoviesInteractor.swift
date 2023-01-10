//
//  UpcomingMoviesInteractor.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import Foundation
import Domain

struct UpcomingMoviesInteractor: MoviesInteractorProtocol {

    private let movieUseCase: MovieUseCaseProtocol

    init(useCaseProvider: UseCaseProviderProtocol) {
        self.movieUseCase = useCaseProvider.movieUseCase()
    }

    func getMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        movieUseCase.getUpcomingMovies(page: page, completion: completion)
    }

}
