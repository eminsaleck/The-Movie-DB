//
//  SearchOptionsInteractor.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import Foundation
import Domain

class SearchOptionsInteractor: SearchOptionsInteractorProtocol {

    private var movieVisitUseCase: MovieVisitUseCaseProtocol
    private let genreUseCase: GenreUseCaseProtocol

    var didUpdateMovieVisit: (() -> Void)?

    init(useCaseProvider: UseCaseProviderProtocol) {
        self.movieVisitUseCase = useCaseProvider.movieVisitUseCase()
        self.genreUseCase = useCaseProvider.genreUseCase()

        self.movieVisitUseCase.didUpdateMovieVisit = { [weak self] in
            self?.didUpdateMovieVisit?()
        }
    }

    func getGenres(completion: @escaping (Result<[Genre], Error>) -> Void) {
        genreUseCase.fetchAll(completion: completion)
    }

    func getMovieVisits(completion: @escaping (Result<[MovieVisit], Error>) -> Void) {
        movieVisitUseCase.getMovieVisits(completion: completion)
    }

}
