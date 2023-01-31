//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 30.01.2023.
//

import UIKit
import Common
import Persistance
import MovieDetailsFeature

class DIContainer{
    
    private let dependencies: FeatureDependencies
    
    private let searchViewModel: SearchViewModel?
    
    init(dependencies: FeatureDependencies) {
        self.dependencies = dependencies
        
        searchViewModel = SearchViewModel()
    }
    
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
    }
}

extension DIContainer: SearchCoordinatorDependencies {
    func buildSearchViewController(coordinator: SearchCoordinatorProtocol?) -> UIViewController {
        let resultsViewModel = buildResultsViewModel(searchViewModel)
        
        searchViewModel.coordinator = coordinator
        searchViewModel.resultsViewModel = resultsViewModel
        
        let searchController = SearchViewController(viewModel: searchViewModel,
                                                    searchController: buildSearchController(resultsViewModel),
                                                    delegate: self)
        return searchController
    }
    
}

