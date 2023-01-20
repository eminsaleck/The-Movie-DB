//
//  MovieReviewsCoordinator.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import UIKit
import Domain
import Common
import DependencyInjection

final class MovieReviewsCoordinator: Coordinator, MovieReviewsCoordinatorProtocol {

    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController

    var movieId: Int!
    var movieTitle: String!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = MovieReviewsViewController.instantiate()

        viewController.viewModel = DIContainer.shared.resolve(arguments: movieId, movieTitle)
        viewController.coordinator = self

        navigationController.pushViewController(viewController, animated: true)
    }

    func showReviewDetail(for review: Review, transitionView: UIView? = nil) {
        let navigationController = UINavigationController()
        let coordinator = MovieReviewDetailCoordinator(navigationController: navigationController)

        coordinator.review = review
        coordinator.presentingViewController = self.navigationController.topViewController
        coordinator.parentCoordinator = unwrappedParentCoordinator
        coordinator.transitioningDelegate = ScaleTransitioningDelegate(viewToScale: transitionView)

        unwrappedParentCoordinator.childCoordinators.append(coordinator)
        coordinator.start()
    }

}
