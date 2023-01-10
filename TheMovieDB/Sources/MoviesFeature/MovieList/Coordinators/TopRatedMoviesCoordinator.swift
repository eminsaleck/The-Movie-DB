//
//  TopRatedMoviesCoordinator.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import UIKit
import Domain
import Shared
import DependencyInjection

final class TopRatedMoviesCoordinator: MovieListCoordinatorProtocol, Coordinator, MovieDetailCoordinable {

    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = MovieListViewController.instantiate()

        viewController.viewModel = DIContainer.shared.resolve(name: "TopRatedMovies",
                                                              argument: LocalizedStrings.topRatedMoviesTitle())
        viewController.coordinator = self

        navigationController.pushViewController(viewController, animated: true)
    }

}
