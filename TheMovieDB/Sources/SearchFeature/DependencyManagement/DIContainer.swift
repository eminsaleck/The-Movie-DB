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

