//
//  SplashInteractor.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import Domain

struct SplashInteractor: SplashInteractorProtocol {

    private let genreUseCase: GenreUseCaseProtocol
    private let configurationUseCase: ConfigurationUseCaseProtocol

    init(useCaseProvider: UseCaseProviderProtocol) {
        self.genreUseCase = useCaseProvider.genreUseCase()
        self.configurationUseCase = useCaseProvider.configurationUseCase()
    }

    // MARK: - SplashInteractorProtocol

    func getAppConfiguration(completion: @escaping (Result<Configuration, Error>) -> Void) {
        configurationUseCase.getConfiguration(completion: completion)
    }

    func getAllGenres(completion: @escaping (Result<[Genre], Error>) -> Void) {
        genreUseCase.fetchAll(completion: completion)
    }

}
