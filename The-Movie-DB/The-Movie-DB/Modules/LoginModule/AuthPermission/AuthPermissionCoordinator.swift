//
//  AuthPermissionCoordinator.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.11.2022.
//

import UIKit

final class AuthPermissionCoordinator: AuthPermissionCoordinatorProtocol {
    var type: CoordinatorType = .login
    
    var finishDelegate: CoordinatorFinishDelegate?
    

    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController

    var authPermissionURL: URL?
    var presentingViewController: UIViewController!
    var authPermissionDelegate: AuthPermissionViewControllerDelegate?

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = AuthPermissionViewController()

        viewController.viewModel = DIContainer.shared.resolve(argument: authPermissionURL)
        viewController.delegate = authPermissionDelegate
        viewController.coordinator = self

        navigationController.pushViewController(viewController, animated: false)

        presentingViewController.present(navigationController, animated: true, completion: nil)
    }

    func dismiss(completion: (() -> Void)? = nil) {
        let presentedViewController = navigationController.topViewController
        presentedViewController?.dismiss(animated: true) { [weak self] in
            completion?()
            self?.parentCoordinator?.finish()
        }
    }

    func didDismiss() {
        parentCoordinator?.finish()
    }

}
