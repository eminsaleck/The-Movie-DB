//
//  SearchMoviesResultInteractor.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import Foundation
import Domain
import Handlers

class SearchMoviesResultInteractor: SearchMoviesResultInteractorProtocol {

    private let movieUseCase: MovieUseCaseProtocol
    private let movieSearchUseCase: MovieSearchUseCaseProtocol
    private let authHandler: AuthenticationHandlerProtocol

    init(useCaseProvider: UseCaseProviderProtocol, authHandler: AuthenticationHandlerProtocol) {
        self.movieUseCase = useCaseProvider.movieUseCase()
        self.movieSearchUseCase = useCaseProvider.movieSearchUseCase()
        self.authHandler = authHandler
    }

    func searchMovies(searchText: String, page: Int?, completion: @escaping (Result<[Movie], Error>) -> Void) {
        let includeAdult = authHandler.currentUser()?.includeAdult ?? false
        movieUseCase.searchMovies(searchText: searchText,
                                  includeAdult: includeAdult,
                                  page: page, completion: completion)
    }

    func saveSearchText(_ searchText: String) {
        movieSearchUseCase.save(with: searchText)
    }

    func getMovieSearches() -> [MovieSearch] {
        return movieSearchUseCase.getMovieSearches()
    }

}
