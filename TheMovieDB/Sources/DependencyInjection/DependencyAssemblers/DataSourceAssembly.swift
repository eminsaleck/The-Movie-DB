//
//  DataSourceAssembly.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 17.12.2022.
//

import Foundation
import Data
import Persistance
import Networking
import Swinject

final class DataSourceAssembly: Assembly {

    func assemble(container: Container) {
        container.register(LocalDataSourceProtocol.self) { _ in
            return LocalDataSource(appGroupExtensions: AppGroup.allCasesIdentifiers)
        }
        container.register(RemoteDataSourceProtocol.self) { _ in
            return RemoteDataSource()
        }
    }

}
