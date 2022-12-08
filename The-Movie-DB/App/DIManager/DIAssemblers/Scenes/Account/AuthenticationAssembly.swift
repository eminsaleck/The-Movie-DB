//
//  AuthAssembler.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.11.2022.
//

import Foundation
import Foundation
import Swinject

final class AuthenticationAssembly: Assembly {

    func assemble(container: Container) {
        container.register(AuthPermissionViewModelProtocol.self) { (_, authPermissionURL: URL) in
            AuthPermissionViewModel(authPermissionURL: authPermissionURL)
        }
    }

}
 
