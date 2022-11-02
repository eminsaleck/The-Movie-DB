//
//  MainCoordinator.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 28.10.2022.
//

import UIKit

protocol MainFlow {
    func coordinateToDetails(with movie: Film, navigationController: UINavigationController)
}

final class MainCoordinator: MainFlow {
    
    var navigationController: UINavigationController
    
    var type = CoordinatorType.detail
    
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainVC = MainAssembler().assembly()
        mainVC.coordinator = self
        navigationController.pushViewController(mainVC, animated: false)
    }
    func openMain() -> MainController {
        let mainVC = MainAssembler().assembly()
        mainVC.coordinator = self
        return mainVC
    }
    
    func coordinateToDetails(with movie: Film, navigationController: UINavigationController) {
        let detailsCoordinator = DetailsCoordinator(navigationController, movie: movie).start()
    }
}
//  
//  func openHome() -> MainController {
//    let mainVC = MainAssembler().assembly()
//      mainVC.coordinator = self
//    return mainVC
//  }
//  
//  func coordinateToDetails(with movie: Film, navController: UINavigationController) {
//    let detailsCoordinator = DetailsCoordinator(navController: navController, movie: movie)
//    coordinate(to: detailsCoordinator)
//  }
//}
