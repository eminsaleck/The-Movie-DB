//
//  ProviderAssembly.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.11.2022.
//

import Foundation
import UseCases
import Data
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
