//
//  UpcomingMoviesAssembly.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 17.12.2022.
//

import Foundation
import Swinject
import Domain

final class UpcomingMoviesAssembly: Assembly {

    func assemble(container: Container) {
        container.register(MoviesInteractorProtocol.self, name: "UpcomingMovies") { resolver in
            guard let useCaseProvider = resolver.resolve(UseCaseProviderProtocol.self) else {
                fatalError("UseCaseProviderProtocol dependency could not be resolved")
            }
            return UpcomingMoviesInteractor(useCaseProvider: useCaseProvider)
        }

        container.register(UpcomingMoviesViewModelProtocol.self) { resolver in
            guard let interactor = resolver.resolve(MoviesInteractorProtocol.self, name: "UpcomingMovies") else {
                fatalError("MoviesInteractorProtocol dependency could not be resolved")
            }
            return UpcomingMoviesViewModel(interactor: interactor)
        }
    }

}
