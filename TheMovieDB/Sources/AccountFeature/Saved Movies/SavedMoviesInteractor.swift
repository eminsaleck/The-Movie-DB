//
//  SavedMoviesInteractor.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 12.12.2022.
//


import Foundation
import Domain

final class FavoritesSavedMoviesInteractor: SavedMoviesInteractorProtocol {

    private let accountUseCase: AccountUseCaseProtocol

    init(useCaseProvider: UseCaseProviderProtocol) {
        self.accountUseCase = useCaseProvider.accountUseCase()
    }

    func getSavedMovies(page: Int?, completion: @escaping (Result<[Movie], Error>) -> Void) {
        accountUseCase.getFavoriteList(page: page, completion: completion)
    }

}

final class WatchlistSavedMoviesInteractor: SavedMoviesInteractorProtocol {

    private let accountUseCase: AccountUseCaseProtocol

    init(useCaseProvider: UseCaseProviderProtocol) {
        self.accountUseCase = useCaseProvider.accountUseCase()
    }

    func getSavedMovies(page: Int?, completion: @escaping (Result<[Movie], Error>) -> Void) {
        accountUseCase.getWatchlist(page: page, completion: completion)
    }

}
