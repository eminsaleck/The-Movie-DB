//
//  MovieVideosInteractor.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import Foundation
import Domain

struct MovieVideosInteractor: MovieVideosInteractorProtocol {

    private let movieUseCase: MovieUseCaseProtocol

    init(useCaseProvider: UseCaseProviderProtocol) {
        self.movieUseCase = useCaseProvider.movieUseCase()
    }

    func getMovieVideos(for movieId: Int, page: Int?, completion: @escaping (Result<[Video], Error>) -> Void) {
        movieUseCase.getMovieVideos(for: movieId, page: page, completion: completion)
    }

}
