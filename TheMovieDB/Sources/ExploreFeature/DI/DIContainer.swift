//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 20.02.2023.
//

import UIKit
import Common

class DIContainer{
    
    private let dependencies: FeatureDependencies
    
    private lazy var genresRepository: GenresRepository = {
      return DefaultGenreRepository(
        remoteDataSource: DefaultGenreRemoteDataSource(dataTransferService: dependencies.apiDataTransferService))
    }()

    init(dependencies: FeatureDependencies) {
        self.dependencies = dependencies
    }
    
    
    func buildModuleCoordinator(navigationController: UINavigationController) -> Coordinator {
        return ExploreCoordinator(navigationController: navigationController, dependencies: self)
    }
    
    private func makeFetchMoviesByGenreUseCase() -> FetchMoviesByGenreUseCase {
      let moviePageRepository = MoviePageRepositoryImplementation(
        moviePageRemoteDataSource: MovieRemoteDataSourceImplementation(dataTransferService: dependencies.apiDataTransferService),
        mapper: DefaultMoviePageMapper(),
        imageBasePath: dependencies.imagesBaseURL
      )
      return DefaultFetchMoviesByGenreUseCase(moviePageRepository: moviePageRepository)
    }
    
    private func makeFetchGenresUseCase() -> FetchGenresUseCase {
      return DefaultFetchGenresUseCase(genresRepository: genresRepository)
    }
}

extension DIContainer: ExploreCoordinatorDependencies{
    private func buildViewModel() -> ExploreViewModel {
        let exploreViewModel = ExploreViewModel(fetchGenresUseCase: makeFetchGenresUseCase(),
                                                fetchMoviesByGenreUseCase: makeFetchMoviesByGenreUseCase())
        
        return exploreViewModel
    }
    
    func buildExploreViewController(coordinator: ExploreCoordinatorProtocol?) -> UIViewController {
        let viewModel = buildViewModel()
        viewModel.coordinator = coordinator
        let exploreVC = ExploreViewController(viewModel: viewModel)
        return exploreVC
    }
}
