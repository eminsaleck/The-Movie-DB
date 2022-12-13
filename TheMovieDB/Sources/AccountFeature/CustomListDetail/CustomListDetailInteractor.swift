//
//  CustomListDetailInteractor.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 12.12.2022.
//


import Foundation
import Domain

final class CustomListDetailInteractor: CustomListDetailInteractorProtocol {

    private let accountUseCase: AccountUseCaseProtocol

    init(useCaseProvider: UseCaseProviderProtocol) {
        self.accountUseCase = useCaseProvider.accountUseCase()
    }

    func getCustomListMovies(listId: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        accountUseCase.getCustomListMovies(listId: listId, completion: completion)
    }

}
