//
//  AuthenticationAssembly.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 17.12.2022.
//

import Foundation
import Swinject

final class AuthenticationAssembly: Assembly {

    func assemble(container: Container) {
        container.register(AuthPermissionViewModelProtocol.self) { (_, authPermissionURL: URL) in
            AuthPermissionViewModel(authPermissionURL: authPermissionURL)
        }
    }

}
