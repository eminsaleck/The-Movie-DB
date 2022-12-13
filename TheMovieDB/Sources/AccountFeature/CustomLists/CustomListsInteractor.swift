//
//  CustomListsInteractor.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 12.12.2022.
//


import Foundation
import Domain

class CustomListsInteractor: CustomListsInteractorProtocol {

    private let accountUseCase: AccountUseCaseProtocol

    init(useCaseProvider: UseCaseProviderProtocol) {
        self.accountUseCase = useCaseProvider.accountUseCase()
    }

    func getCustomLists(page: Int?, completion: @escaping (Result<[List], Error>) -> Void) {
        accountUseCase.getCustomLists(page: page, completion: completion)
    }

}
