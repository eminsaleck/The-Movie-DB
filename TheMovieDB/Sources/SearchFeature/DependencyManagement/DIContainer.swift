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
    
    private func makeSearchShowsUseCase() -> SearchMovieUseCase {
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
}

extension DIContainer: SearchCoordinatorDependencies {
    func buildSearchViewController(coordinator: SearchCoordinatorProtocol?) -> UIViewController {
        
      let resultsViewModel = buildResultsViewModel(with: searchViewModel)

      searchViewModel.coordinator = coordinator
      searchViewModel.resultsViewModel = resultsViewModel

      let searchVC = SearchViewController(viewModel: searchViewModel,
                                          searchController: buildSearchController(with: resultsViewModel),
                                          delegate: self)
      return searchVC
    }
    
    private func buildSearchController(with viewModel: ResultsSearchViewModelProtocol) -> UISearchController {
      let resultsController = ResultsSearchViewController(viewModel: viewModel)
      let searchController = UISearchController(searchResultsController: resultsController)
      return searchController
    }
}

