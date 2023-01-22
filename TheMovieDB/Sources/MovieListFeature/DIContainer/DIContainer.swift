//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 22.01.2023.
//

import UIKit
import Common
import MovieDetailsFeatureInterface
import MovieListFeatureInterface

final class DIContainer: MovieListCoordinatorDependencies {
    private let dependencies: MovieListFeatureInterface.ModuleDependencies
    
    private lazy var accountShowsRepository: AccountMovieRepository = {
        return DefaultAccountTVShowsRepository(
            showsPageRemoteDataSource: AccountMovieRemoteDataSource(dataTransferService: dependencies.apiDataTransferService),
            mapper: DefaultMoviePageMapper(),
            imageBasePath: dependencies.imagesBaseURL,
            loggedUserRepository: dependencies.loggedUserRepository
        )
    }()

    
    init(dependencies: MovieListFeatureInterface.ModuleDependencies) {
        self.dependencies = dependencies
    }
    
    func buildModuleCoordinator(navigationController: UINavigationController,
                                delegate: MovieListCoordinatorDelegate?)
    -> MovieListCoordinatorProtocol {
      let coordinator =  MovieListCoordinator(navigationController: navigationController, dependencies: self)
      coordinator.delegate = delegate
      return coordinator
    }
}
