//
//  UseCaseProviderProtocol.swift
//  UseCases
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

public protocol UseCaseProviderProtocol {

    func userUseCase() -> UserUseCaseProtocol
    func accountUseCase() -> AccountUseCaseProtocol
    func authUseCase() -> AuthUseCaseProtocol

}
