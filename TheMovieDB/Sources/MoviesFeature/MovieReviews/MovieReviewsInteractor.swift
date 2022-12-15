//
//  MovieReviewsInteractor.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import UpcomingMoviesDomain

final class MovieReviewsInteractor: MovieReviewsInteractorProtocol {

    private let movieUseCase: MovieUseCaseProtocol

    init(useCaseProvider: UseCaseProviderProtocol) {
        self.movieUseCase = useCaseProvider.movieUseCase()
    }

    func getMovieReviews(for movieId: Int, page: Int?, completion: @escaping (Result<[Review], Error>) -> Void) {
        movieUseCase.getMovieReviews(for: movieId, page: page, completion: completion)
    }

}
