//
//  Favourite.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 08.11.2022.
//
import UIKit

protocol FavoriteCoordinatorFlow {
  
}

final class FavoriteCoordinator: CoordinatorProtocol, FavoriteCoordinatorFlow {
  
  let navController: UINavigationController
  
  init(navController: UINavigationController) {
    self.navController = navController
  }
  
  func start() {
    let favController = FavoriteAssembler().assembly()
    favController.coordinator = self
    navController.pushViewController(favController, animated: true)
  }
}
