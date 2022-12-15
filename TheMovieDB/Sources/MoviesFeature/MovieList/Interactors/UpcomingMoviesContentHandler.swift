//
//  UpcomingMoviesContentHandler.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import Foundation
import UpcomingMoviesDomain

struct UpcomingMoviesInteractor: MoviesInteractorProtocol {

    let movieUseCase: MovieUseCaseProtocol

    init(useCaseProvider: UseCaseProviderProtocol) {
        self.movieUseCase = movieUseCase
    }

    var displayTitle: String {
        return "Upcoming Movies"
    }

    func getMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        movieUseCase.getUpcomingMovies(page: page, completion: completion)
    }

}
