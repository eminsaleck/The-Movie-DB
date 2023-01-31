//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 30.01.2023.
//

import UIKit
import Common
import MovieDetailsFeature

class DIContainer{
    
    private let dependencies: FeatureDependencies
    
    private let searchViewModel: SearchViewModel?
    
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
        return SearchViewController()
    }
}
extension DIContainer{
    // MARK: - SearchViewControllerDelegate

}
