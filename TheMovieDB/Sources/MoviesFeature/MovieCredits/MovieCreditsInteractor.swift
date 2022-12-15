//
//  MovieCreditsInteractor.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import Foundation
import UpcomingMoviesDomain

final class MovieCreditsInteractor: MovieCreditsInteractorProtocol {

    private let movieUseCase: MovieUseCaseProtocol

    init(useCaseProvider: UseCaseProviderProtocol) {
        self.movieUseCase = useCaseProvider.movieUseCase()
    }

    func getMovieCredits(for movieId: Int, page: Int?,
                         completion: @escaping (Result<MovieCredits, Error>) -> Void) {
        movieUseCase.getMovieCredits(for: movieId, page: page, completion: completion)
    }

}
