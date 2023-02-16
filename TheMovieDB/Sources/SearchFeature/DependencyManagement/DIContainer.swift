//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 30.01.2023.
//

import UIKit
import Common
import Persistance

class DIContainer{
    
    private let dependencies: FeatureDependencies
    
    private let searchViewModel: SearchViewModel
    
    init(dependencies: FeatureDependencies) {
        self.dependencies = dependencies
        
        searchViewModel = SearchViewModel()
    }
    
    
    func buildModuleCoordinator(navigationController: UINavigationController) -> Coordinator {
        return SearchCoordinator(navigationController: navigationController, dependencies: self)
    }

    //MARK: - UseCases
    private func makeSearchMovieUseCase() -> SearchMovieUseCase {
        let moviePageRepository = MoviePageRepositoryImplementation(
            moviePageRemoteDataSource: MovieRemoteDataSourceImplementation(dataTransferService: dependencies.apiDataTransferService),
            mapper: DefaultMoviePageMapper(),
            imageBasePath: dependencies.imagesBaseURL
        )
        return SearchMovieUseCaseImplementation(
            moviePageRepository: moviePageRepository,
            searchsLocalRepository: dependencies.searchsPersistence
        )
    }
    
    private func makeFetchPopularUseCase() -> PopularUseCase {
        let moviePageRepository = MoviePageRepositoryImplementation(
            moviePageRemoteDataSource: MovieRemoteDataSourceImplementation(dataTransferService: dependencies.apiDataTransferService),
            mapper: DefaultMoviePageMapper(),
            imageBasePath: dependencies.imagesBaseURL
        )
        return PopularUseCaseImplementation(
            moviePageRepository: moviePageRepository
        )
    }
    
    private func makeFetchRecentSearchesUseCase() -> FetchSearchesUseCase {
        return FetchSearchesUseCaseImplementation(searchLocalRepository: dependencies.searchsPersistence)
    }

    private func buildResultsViewModel(
        with delegate: ResultsViewModelDelegate?) -> ResultsViewModelProtocol {
            let resultsViewModel = ResultsViewModel(searchTVShowsUseCase: makeSearchMovieUseCase(),
                                                    fetchRecentSearchesUseCase: makeFetchRecentSearchesUseCase())
      resultsViewModel.delegate = searchViewModel
      return resultsViewModel
    }
}

extension DIContainer: SearchCoordinatorDependencies {
    
    func buildSearchViewController(coordinator: SearchCoordinatorProtocol?) -> UIViewController {
        
        searchViewModel.coordinator = coordinator
        
        let searchController = SearchViewController(viewModel: searchViewModel,
                                                    searchControllerFactory: self)
        return searchController
    }
    
}

extension DIContainer: SearchViewControllerFactory {
    func buildSearchPopularController() -> UIViewController {
        let viewModel = SearchPopularViewModel(fetchPopularUseCase: makeFetchPopularUseCase())
        viewModel.delegate = searchViewModel
        let viewController = SearchPopularViewController(viewModel: viewModel)
        return viewController
    }
}

