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
    
<<<<<<< HEAD
    func buildModuleCoordinator(navigationController: UINavigationController) -> Coordinator {
      return SearchCoordinator(navigationController: navigationController, dependencies: self)
=======
    //MARK: - UseCases
    
    private func makeSearchMovieUseCase() -> SearchMovieUseCase {
        let moviePageRepository = MoviePageRepositoryImplementation(
            showsPageRemoteDataSource: MovieRemoteDataSourceImplementation(dataTransferService: dependencies.apiDataTransferService),
            mapper: DefaultMoviePageMapper(),
            imageBasePath: dependencies.imagesBaseURL
        )
        return SearchMovieUseCaseImplementation(
            moviePageRepository: moviePageRepository,
            searchsLocalRepository: dependencies.searchsPersistence
        )
    }
    
    private func makeFetchSearchesUseCase() -> FetchSearchesUseCase {
        return FetchSearchesUseCaseImplementation(searchLocalRepository: dependencies.searchsPersistence)
    }
    //MARK: - assembling scenes
    
    private func buildSearchController(viewModel: ResultsViewModelProtocol) -> UISearchController {
        let resultsController = ResultsViewController(viewModel)
        let searchController = UISearchController(searchResultsController: resultsController)
        return searchController
    }
    private func buildResultsViewModel(_ delegate: ResultsViewModelDelegate?) -> ResultsViewModelProtocol {
        let resultsViewModel = ResultsViewModel(searchMovieUseCase: makeSearchMovieUseCase(),
                                                fetchRecentSearchesUseCase: makeFetchSearchesUseCase())
        resultsViewModel.delegate = searchViewModel
        return resultsViewModel
>>>>>>> c97a1487e6a73bb235ce3fd18bd2bf5d0afaad83
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
        let viewModel = SearchPopularViewModel()
        let viewController = SearchPopularViewController(viewModel: viewModel)
        return viewController
    }
}

