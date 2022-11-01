//
//  MainCoordinator.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 28.10.2022.
//

import UIKit

protocol MainFlow {
  func coordinateToDetails(with movie: Film, navController: UINavigationController)
  func openHome() -> MainController
}

final class MainCoordinator: CoordinatorProtocol, MainFlow {
  
  let navController: UINavigationController
  
  init(navController: UINavigationController) {
    self.navController = navController
  }
  
  func start() {
    let mainVC = MainAssembler().assembly()
    mainVC.coordinator = self
    navController.pushViewController(mainVC, animated: false)
  }
  
  func openHome() -> MainController {
    let mainVC = MainAssembler().assembly()
      mainVC.coordinator = self
    return mainVC
  }
  
  func coordinateToDetails(with movie: Film, navController: UINavigationController) {
    let detailsCoordinator = DetailsCoordinator(navController: navController, movie: movie)
    coordinate(to: detailsCoordinator)
  }
}
