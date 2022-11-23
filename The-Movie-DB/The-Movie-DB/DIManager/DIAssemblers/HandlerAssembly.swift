//
//  HandlerAssembly.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.11.2022.
//

import Foundation
import UseCases
import Swinject

final class HandlerAssembly: Assembly {

    func assemble(container: Container) {
        container.register(AuthenticationHandlerProtocol.self) { resolver in
            guard let useCaseProvider = resolver.resolve(UseCaseProviderProtocol.self) else {
                fatalError("UseCaseProviderProtocol dependency could not be resolved")
            }
            return AuthenticationHandler(authUseCase: useCaseProvider.authUseCase(),
                                         userUseCase: useCaseProvider.userUseCase())
        }.inObjectScope(.container)

        
        container.register(NavigationHandlerProtocol.self) { _ in
            NavigationHandler()
        }.inObjectScope(.container)

    }
    
    

}
