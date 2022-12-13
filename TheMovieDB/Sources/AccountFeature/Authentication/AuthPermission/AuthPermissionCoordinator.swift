//
//  AuthPermissionCoordinator.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 12.12.2022.
//

import UIKit
import Shared

final class AuthPermissionCoordinator: AuthPermissionCoordinatorProtocol {

    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController

    var authPermissionURL: URL?
    var presentingViewController: UIViewController!
    var authPermissionDelegate: AuthPermissionViewControllerDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = AuthPermissionViewController.instantiate()
        viewController.viewModel = AuthPermissionViewModel(authPermissionURL: authPermissionURL)
//        viewController.viewModel = DIContainer.shared.resolve(argument: authPermissionURL)
        viewController.delegate = authPermissionDelegate
        viewController.coordinator = self

        navigationController.pushViewController(viewController, animated: false)

        presentingViewController.present(navigationController, animated: true, completion: nil)
    }

    func dismiss(completion: (() -> Void)? = nil) {
        let presentedViewController = navigationController.topViewController
        presentedViewController?.dismiss(animated: true) { [weak self] in
            completion?()
            self?.parentCoordinator?.childDidFinish()
        }
    }

    func didDismiss() {
        parentCoordinator?.childDidFinish()
    }

}
