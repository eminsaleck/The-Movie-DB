//
//  CustomListDetailAssembly.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 17.12.2022.
//

import Foundation
import Swinject
import Domain
import AccountFeature

final class CustomListDetailAssembly: Assembly {

    func assemble(container: Container) {
        container.register(CustomListDetailInteractorProtocol.self) { resolver in
            guard let useCaseProvider = resolver.resolve(UseCaseProviderProtocol.self) else {
                fatalError("UseCaseProviderProtocol dependency could not be resolved")
            }
            return CustomListDetailInteractor(useCaseProvider: useCaseProvider)
        }

        container.register(CustomListDetailViewModelProtocol.self) { (resolver, list: List) in
            guard let interactor = resolver.resolve(CustomListDetailInteractorProtocol.self) else {
                fatalError("CustomListDetailInteractorProtocol dependency could not be resolved")
            }
            return CustomListDetailViewModel(list, interactor: interactor)
        }
    }

}
