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

final class ExploreCoordinator: NavigationCoordinator, ExploreCoordinatorProtocol{
    
    public let navigationController: UINavigationController
    private let dependencies: ExploreCoordinatorDependencies
    private var childCoordinators = [ExploreChildCoordinator: NavigationCoordinator]()
    
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
        case .allIsPicked(let id):
            navigateToMovieListScreen(with: id)
        }
    }
    
    private func navigateToExplore(){
        let exploreVC = dependencies.buildExploreViewController(coordinator: self)
        exploreVC.navigationItem.title = Localized.exploreTabbar.localized()
        navigationController.pushViewController(exploreVC, animated: true)
    }
    
    private func navigateToMovieListScreen(with id: Int) {
        print("Genre PICKED - \(id)")
    }

    private func navigateToMovieDetailScreen(with id: Int) {
      let detailCoordinator = dependencies.buildMovieDetailCoordinator(navigationController: navigationController, delegate: self)
        
        childCoordinators[.detailMovie] = detailCoordinator

        let nextState = MovieDetailsState.movieDetailsIsRequired(withId: id)
        detailCoordinator.navigate(with: nextState)
    }
}

extension ExploreCoordinator: MovieDetailCoordinatorDelegate {
    public func movieDetailCoordinatorDidFinish() {
        childCoordinators[.detailMovie] = nil
    }
}
