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
    
    private lazy var accountMovieRepository: AccountMovieDetailsRepository = {
        return AccountMovieDetailsRepositoryImplementation(
            movieRemoteDataSource: AccountMovieDetailsRemoteDataSource(dataTransferService: dependencies.apiDataTransferService),
            mapper: DefaultAccountMovieDetailsMapper(),
            loggedUserRepository: dependencies.loggedUserRepository
        )
    }()
    
    private func makeFetchMovieDetailsUseCase() -> FetchMovieDetailsUseCase {
      let movieDetailsRepository = MovieDetailRepositoryImplementation(
        moviePageRemoteDataSource: MovieDetailsRemoteDataSource(dataTransferService: dependencies.apiDataTransferService),
        mapper: DefaultMovieDetailsMapper(),
        imageBasePath: dependencies.imagesBaseURL
      )
      return FetchMovieDetailsUseCaseImplementation(
        movieDetailsRepository: movieDetailsRepository
      )
    }

    
    private func makeMarkAsFavoriteUseCase() -> MarkAsFavoriteUseCase {
        return DefaultMarkAsFavoriteUseCase(accountMovieRepository: accountMovieRepository)
    }

    private func makeSaveToWatchListUseCase() -> SaveToWatchListUseCase {
        return DefaultSaveToWatchListUseCase(accountMovieRepository: accountMovieRepository)
    }

    private func makeAccountStatesUseCase() -> FetchAccountStates {
        return DefaultFetchAccountStates(accountMovieRepository: accountMovieRepository)
    }

    private func makeFetchLoggedUserUseCase() -> FetchLoggedUser {
      return FetchLoggedUserImplementation(loggedRepository: dependencies.loggedUserRepository)
    }
    
    init(dependencies: ModuleDependencies) {
        self.dependencies = dependencies
    }
    
    func buildModuleCoordinator(navigationController: UINavigationController, delegate: MovieDetailCoordinatorDelegate?) -> MovieDetailCoordinator {
        let coordinator = MovieDetailCoordinator(navigationController: navigationController, dependencies: self)
        coordinator.delegate = delegate
        return coordinator
    }
}

extension DIContainer: MovieDetailCoordinatorDependencies {
    func buildMovieDetailsViewController(with movieId: Int,
                                        coordinator: MovieDetailCoordinatorProtocol?,
                                        closures: MovieDetailViewModelClosures? = nil) -> UIViewController {
        let viewModel = MovieDetailViewModel(movieId: movieId,
                                             fetchLoggedUser: makeFetchLoggedUserUseCase(),
                                             fetchDetailsUseCase: makeFetchMovieDetailsUseCase(),
                                             fetchMovieAccountState: makeAccountStatesUseCase(),
                                             markAsFavoriteUseCase: makeMarkAsFavoriteUseCase(),
                                             saveToWatchListUseCase: makeSaveToWatchListUseCase(),
                                             coordinator: coordinator, closures: closures)
        let detailVC = MovieDetailViewController(viewModel: viewModel)
        return detailVC
    }
}
