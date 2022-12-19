//
//  CustomListsAssembly.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 17.12.2022.
//

import Foundation
import Swinject
import UpcomingMoviesDomain

final class CustomListsAssembly: Assembly {

    func assemble(container: Container) {
        container.register(CustomListsInteractorProtocol.self) { resolver in
            guard let useCaseProvider = resolver.resolve(UseCaseProviderProtocol.self) else {
                fatalError("UseCaseProviderProtocol dependency could not be resolved")
            }
            return CustomListsInteractor(useCaseProvider: useCaseProvider)
        }

        container.register(CustomListsViewModelProtocol.self) { resolver in
            guard let interactor = resolver.resolve(CustomListsInteractorProtocol.self) else {
                fatalError("CustomListsInteractorProtocol dependency could not be resolved")
            }
            return CustomListsViewModel(interactor: interactor)
        }
    }

}
