//
//  CustomListDetailCoordinator.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 12.12.2022.
//


import UIKit
import UI
import Shared
import Domain

final class CustomListDetailCoordinator: CustomListDetailCoordinatorProtocol, Coordinator, MovieDetailCoordinable {

    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController

    var customList: List!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = CustomListDetailViewController.instantiate()

        viewController.viewModel = DIContainer.shared.resolve(argument: customList)
        viewController.coordinator = self

        navigationController.pushViewController(viewController, animated: true)
    }

}
