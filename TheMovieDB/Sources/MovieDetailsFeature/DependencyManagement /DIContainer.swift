//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 23.01.2023.
//

import UIKit
import Common
import MovieDetailsFeatureInterface

final class DIContainer {
    
    private let dependencies: ModuleDependencies
    
    private lazy var accountShowsRepository: AccountMovieDetailsRepository = {
        return DefaultAccountMovieDetailsRepository(
            showsRemoteDataSource: AccountMovieDetailsRemoteDataSource(dataTransferService: dependencies.apiDataTransferService),
            mapper: DefaultAccountMovieDetailsMapper(),
            loggedUserRepository: dependencies.loggedUserRepository
        )
    }()
    
    init(dependencies: ModuleDependencies) {
        self.dependencies = dependencies
    }
    
    func buildModuleCoordinator(navigationController: UINavigationController, delegate: MovieDetailCoordinatorDelegate?) -> MovieDetailCoordinator {
        let coordinator = MovieDetailCoordinator(navigationController: navigationController, dependencies: self)
        coordinator.delegate = delegate
        return coordinator
    }
    
    func buildMovieDetailsViewController(with showId: Int,
                                        coordinator: MovieDetailCoordinatorProtocol?,
                                        closures: MovieDetailViewModelClosures? = nil) -> UIViewController {
        let viewModel = MovieDetailViewModel()
        let detailVC = MovieDetailViewController(viewModel: viewModel)
        return detailVC
    }
}

extension DIContainer: MovieDetailCoordinatorDependencies {

}
