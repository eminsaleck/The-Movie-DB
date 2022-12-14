//
//  MainTabBarBuilder.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import UIKit
import Domain
import MoviesFeature

struct RootCoordinatorIdentifier {
    static let upcomingMovies = "upcoming"
    static let searchMovies = "search"
    static let account = "account"
}

final class MainTabBarBuilder {

    class func buildViewCoordinators() -> [RootCoordinator] {

        let upcomingMoviesNavigationController = createNavigationController(title: "Upcoming", image: #imageLiteral(resourceName: "Movies"))
        let upcomingMoviesCoordinator = UpcomingMoviesCoordinator(navigationController: upcomingMoviesNavigationController)
        upcomingMoviesCoordinator.start()

        let searchMoviesNavigationController = createNavigationController(title: "Search", image: #imageLiteral(resourceName: "Search"))
        let searchMoviesCoordinator = SearchMoviesCoordinator(navigationController: searchMoviesNavigationController)
        searchMoviesCoordinator.start()

        let accountNavigationController = createNavigationController(title: "Account", image: #imageLiteral(resourceName: "Account"))
        let accountCoordinator = AccountCoordinator(navigationController: accountNavigationController)
        accountCoordinator.start()

        return [
            upcomingMoviesCoordinator,
            searchMoviesCoordinator,
            accountCoordinator
        ]
    }

    class func createNavigationController(title: String, image: UIImage) -> UINavigationController {
        let navController = UINavigationController()
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image

        return navController
    }

}
