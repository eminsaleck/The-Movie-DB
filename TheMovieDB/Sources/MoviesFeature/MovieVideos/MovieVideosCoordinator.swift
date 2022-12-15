//
//  MovieVideosCoordinator.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import UIKit

final class MovieVideosCoordinator: Coordinator, MovieVideosCoordinatorProtocol {

    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController

    var movieId: Int!
    var movieTitle: String!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = MovieVideosViewController.instantiate()

        viewController.viewModel = DIContainer.shared.resolve(arguments: movieId, movieTitle)
        viewController.coordinator = self

        navigationController.pushViewController(viewController, animated: true)
    }

}
