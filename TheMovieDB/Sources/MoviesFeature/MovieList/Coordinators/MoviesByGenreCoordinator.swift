//
//  MoviesByGenreCoordinator.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import UIKit
import Domain
import Common
import UI
import DependencyInjection

final class MoviesByGenreCoordinator: MovieListCoordinatorProtocol, Coordinator, MovieDetailCoordinable {

    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController

    var genreId: Int!
    var genreName: String!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = MovieListViewController.instantiate()

        viewController.viewModel = DIContainer.shared.resolve(name: "MoviesByGenre",
                                                              arguments: genreId, genreName)
        viewController.coordinator = self

        navigationController.pushViewController(viewController, animated: true)
    }

}
