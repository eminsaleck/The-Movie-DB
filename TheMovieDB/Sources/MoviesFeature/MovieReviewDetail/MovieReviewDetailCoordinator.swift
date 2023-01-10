//
//  MovieReviewDetailCoordinator.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import UIKit
import Domain
import Shared
import DependencyInjection

final class MovieReviewDetailCoordinator: Coordinator, MovieReviewDetailCoordinatorProtocol {

    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController

    var review: Review!
    var presentingViewController: UIViewController!
    var transitioningDelegate: UIViewControllerTransitioningDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = MovieReviewDetailViewController.instantiate()

        viewController.viewModel = DIContainer.shared.resolve(argument: review)
        viewController.coordinator = self

        navigationController.pushViewController(viewController, animated: false)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.transitioningDelegate = transitioningDelegate

        presentingViewController.present(navigationController, animated: true, completion: nil)
    }

    func dismiss() {
        let presentedViewController = navigationController.topViewController
        presentedViewController?.dismiss(animated: true) { [weak self] in
            self?.parentCoordinator?.childDidFinish()
        }
    }

}
