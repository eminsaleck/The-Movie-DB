//
//  ProviderAssembly.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 17.12.2022.
//

import Foundation
import Domain
import Data
import Persistance
import Networking
import Swinject

final class ProviderAssembly: Assembly {

    func assemble(container: Container) {
        container.register(UseCaseProviderProtocol.self) { resolver in
            guard let localDataSource = resolver.resolve(LocalDataSourceProtocol.self) else {
                fatalError("LocalDataSourceProtocol dependency could not be resolved")
            }
            guard let remoteDataSource = resolver.resolve(RemoteDataSourceProtocol.self) else {
                fatalError("RemoteDataSourceProtocol dependency could not be resolved")
            }
            return UseCaseProvider(localDataSource: localDataSource, remoteDataSource: remoteDataSource)
        }
    }

}
