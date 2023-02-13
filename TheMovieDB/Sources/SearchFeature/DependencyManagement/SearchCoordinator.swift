//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 31.01.2023.
//

import UIKit
import Common
import UI
import MovieDetailsFeatureInterface

class SearchCoordinator: NavigationCoordinator, SearchCoordinatorProtocol{
    
    var navigationController: UINavigationController
    private let dependencies: SearchCoordinatorDependencies
    
    private var childCoordinators = [SearchChildCoordinator: Coordinator]()
    
    
    public init(navigationController: UINavigationController, dependencies: DIContainer){
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    public func start() {
        navigate(with: .searchInit)
    }
    
    public func navigate(with state: SearchState) {
        switch state {
        case .searchInit:
            navigateToSearch()
        case .movieIsPicked(let id):
            navigateToMovieDetailScreen(with: id)
        }
    }
    
    private func navigateToSearch(){
        let searchVC = dependencies.buildSearchViewController(coordinator: self)
        searchVC.navigationItem.title = Localized.searchTitle.localized()
        navigationController.pushViewController(searchVC, animated: true)
    }
    
    private func navigateToMovieDetailScreen(with id: Int) {
        print("MOVIE PICKED - \(id)")
    }
  }

