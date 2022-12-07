//
//  UseCaseProviderProtocol.swift
//  Domain
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

public protocol UseCaseProviderProtocol {

    func movieUseCase() -> MovieUseCaseProtocol
    func genreUseCase() -> GenreUseCaseProtocol
    func movieVisitUseCase() -> MovieVisitUseCaseProtocol
    func movieSearchUseCase() -> MovieSearchUseCaseProtocol
    func userUseCase() -> UserUseCaseProtocol
    func accountUseCase() -> AccountUseCaseProtocol
    func authUseCase() -> AuthUseCaseProtocol
    func configurationUseCase() -> ConfigurationUseCaseProtocol

}
