//
//  AdapterAssembly.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 17.12.2022.
//

import Foundation
import Swinject

final class AdapterAssembly: Assembly {

    func assemble(container: Container) {
        container.register(ProgressHUDAdapterProtocol.self) { _ in
            ProgressHUDAdapter()
        }.inObjectScope(.container)
    }

}
