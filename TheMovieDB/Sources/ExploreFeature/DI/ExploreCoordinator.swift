//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 20.02.2023.
//

import UIKit
import Common
import UI
import MovieDetailsFeatureInterface

class ExploreCoordinator: NavigationCoordinator, ExploreCoordinatorProtocol{
    
    var navigationController: UINavigationController
    private let dependencies: ExploreCoordinatorDependencies

    
    public init(navigationController: UINavigationController, dependencies: DIContainer){
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    public func start() {
        navigate(with: .exploreInit)
    }
    
    public func navigate(with state: ExploreState) {
        switch state {
        case .exploreInit:
            navigateToExplore()
        case .movieIsPicked(let id):
            navigateToMovieDetailScreen(with: id)
        case .allIsPicked(let id, let title):
            navigateToMovieListScreen(with: id, title: title)
        }
    }
    
    private func navigateToExplore(){
        let exploreVC = dependencies.buildExploreViewController(coordinator: self)
        exploreVC.navigationItem.title = Localized.exploreTabbar.localized()
        navigationController.pushViewController(exploreVC, animated: true)
    }
    
    private func navigateToMovieListScreen(with id: Int, title: String) {
        print("Genre PICKED - \(id)")
    }
    
    private func navigateToMovieDetailScreen(with id: Int) {
        print("MOVIE PICKED - \(id)")
    }
  }


