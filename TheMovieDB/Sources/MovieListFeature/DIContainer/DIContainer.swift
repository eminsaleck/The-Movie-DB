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

final class DIContainer {
    private let dependencies: MovieListFeatureInterface.ModuleDependencies
    
    // MARK: - Repositories
    private lazy var accountShowsRepository: AccountMovieRepository = {
        return DefaultAccountTVShowsRepository(
            showsPageRemoteDataSource: AccountMovieRemoteDataSource(dataTransferService: dependencies.apiDataTransferService),
            mapper: DefaultMoviePageMapper(),
            imageBasePath: dependencies.imagesBaseURL,
            loggedUserRepository: dependencies.loggedUserRepository
        )
    }()
    
    // MARK: - Initializer
    init(dependencies: MovieListFeatureInterface.ModuleDependencies) {
        self.dependencies = dependencies
    }
}
