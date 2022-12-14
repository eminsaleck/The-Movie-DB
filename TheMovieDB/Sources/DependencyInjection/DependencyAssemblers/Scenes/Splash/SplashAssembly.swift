//
//  SplashAssembly.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 17.12.2022.
//

import Foundation
import Swinject
import Domain

final class SplashAssembly: Assembly {

    func assemble(container: Container) {
        container.register(SplashInteractorProtocol.self) { resolver in
            guard let useCaseProvider = resolver.resolve(UseCaseProviderProtocol.self) else {
                fatalError("UseCaseProviderProtocol dependency could not be resolved")
            }
            return SplashInteractor(useCaseProvider: useCaseProvider)
        }

        container.register(SplashViewModelProtocol.self) { resolver in
            guard let interactor = resolver.resolve(SplashInteractorProtocol.self) else {
                fatalError("SplashInteractorProtocol dependency could not be resolved")
            }
            guard let genreHandler = resolver.resolve(GenreHandlerProtocol.self) else {
                fatalError("GenreHandlerProtocol dependency could not be resolved")
            }
            guard let configurationHandler = resolver.resolve(ConfigurationHandlerProtocol.self) else {
                fatalError("ConfigurationHandlerProtocol dependency could not be resolved")
            }
            return SplashViewModel(interactor: interactor,
                                   genreHandler: genreHandler,
                                   configurationHandler: configurationHandler)
        }
    }

}
