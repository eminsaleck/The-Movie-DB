//
//  SplashBuilder.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import UIKit

final class SplashBuilder {

    class func buildViewController() -> UIViewController {
        let viewController = SplashViewController.instantiate()
        viewController.viewModel = DIContainer.shared.resolve()

        let navigationController = UINavigationController(rootViewController: viewController)

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navigationController]

        return tabBarController
    }

}
