//
//  RecommendedMoviesInteractor.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import Domain

struct RecommendedMoviesInteractor: MoviesInteractorProtocol {

    private let accountUseCase: AccountUseCaseProtocol

    init(useCaseProvider: UseCaseProviderProtocol) {
        self.accountUseCase = useCaseProvider.accountUseCase()
    }

    func getMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        accountUseCase.getRecommendedList(page: page, completion: completion)
    }

}
