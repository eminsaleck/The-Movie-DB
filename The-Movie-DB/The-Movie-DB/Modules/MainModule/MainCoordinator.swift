//
//  MainCoordinator.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 28.10.2022.
//

import UIKit

protocol MainFlow {
    func coordinateToDetails(with movie: Film, navController: UINavigationController)
}

final class MainCoordinator: CoordinatorProtocol, MainFlow {

    let window: UIWindow

    
    init(window: UIWindow) {
        self.window = window
    }

    
    func start() {
        let viewController = MainAssembler().assembly()
        viewController.coordinator = self
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
    
    func coordinateToDetails(with movie: Film, navController: UINavigationController = UINavigationController()) {
      let detailsCoordinator = DetailCoordinator(navController: navController, movie: movie)
      coordinate(to: detailsCoordinator)
    }
}
