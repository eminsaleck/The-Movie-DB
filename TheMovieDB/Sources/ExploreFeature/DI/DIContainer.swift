//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 20.02.2023.
//

import UIKit
import Common
import MovieDetailsFeatureInterface

class DIContainer{
    
    private let dependencies: FeatureDependencies
    
    private lazy var genresRepository: GenresRepository = {
        return DefaultGenreRepository(
            remoteDataSource: DefaultGenreRemoteDataSource(dataTransferService: dependencies.apiDataTransferService),
            mapper: DefaultMoviePageMapper(),
            imageBasePath: dependencies.imagesBaseURL)
    }()
    
    init(dependencies: FeatureDependencies) {
        self.dependencies = dependencies
    }
    
    func buildModuleCoordinator(navigationController: UINavigationController) -> Coordinator {
        return ExploreCoordinator(navigationController: navigationController, dependencies: self)
    }
    
    private func makeFetchGenresUseCase() -> FetchGenresUseCase {
        return DefaultFetchGenresUseCase(genresRepository: genresRepository)
    }
}

extension DIContainer: ExploreCoordinatorDependencies{
    func buildMovieDetailCoordinator(navigationController: UINavigationController,
                                     delegate: MovieDetailCoordinatorDelegate?) -> MovieDetailCoordinatorProtocol {
        return dependencies.movieDetailsBuilder.buildModuleCoordinator(in: navigationController, delegate: delegate)
    }
    
    private func buildViewModel() -> ExploreViewModel {
        let exploreViewModel = ExploreViewModel(fetchGenresUseCase: makeFetchGenresUseCase())
        
        return exploreViewModel
    }
    
    func buildExploreViewController(coordinator: ExploreCoordinatorProtocol?) -> UIViewController {
        let viewModel = buildViewModel()
        viewModel.coordinator = coordinator
        let exploreVC = ExploreViewController(viewModel: viewModel)
        return exploreVC
    }
}
