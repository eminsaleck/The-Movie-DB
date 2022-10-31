//
//  MainCoordinator.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 28.10.2022.
//

import UIKit

protocol MainFlow {
    func openHome(navController: UINavigationController, movie: Film)
    
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
    
    func openHome(navController: UINavigationController, movie: Film){
        
      let detailCoordinator = DetailCoordinator(navController: navController, movie: movie)
        coordinate(to: detailCoordinator)
    }
}
