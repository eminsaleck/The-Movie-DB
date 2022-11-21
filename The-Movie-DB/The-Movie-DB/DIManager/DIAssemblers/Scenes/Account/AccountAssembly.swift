//
//  AccountAssembly.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.11.2022.
//

import Foundation
import Swinject
import UseCases
//
//final class AccountAssembly: Assembly {
//
//    func assemble(container: Container) {
//        container.register(AccountInteractorProtocol.self) { resolver in
//            guard let useCaseProvider = resolver.resolve(UseCaseProviderProtocol.self) else {
//                fatalError("UseCaseProviderProtocol dependency could not be resolved")
//            }
//            guard let authHandler = resolver.resolve(AuthenticationHandlerProtocol.self) else {
//                fatalError("AuthenticationHandlerProtocol dependency could not be resolved")
//            }
//            return AccountInteractor(useCaseProvider: useCaseProvider,
//                                     authHandler: authHandler)
//        }
//
//        container.register(AccountViewModelProtocol.self) { resolver in
//            guard let interactor = resolver.resolve(AccountInteractorProtocol.self) else {
//                fatalError("AccountInteractorProtocol dependency could not be resolved")
//            }
//            return AccountViewModel(interactor: interactor)
//        }
//    }
//
//}
