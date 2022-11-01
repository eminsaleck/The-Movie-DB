//
//  DetailCoordinator.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 29.10.2022.
//

import UIKit

protocol DetailsCoordinatorFlow { }

final class DetailsCoordinator: CoordinatorProtocol, DetailsCoordinatorFlow {
  
  let navController: UINavigationController
  let movie: Film
  
  init(navController: UINavigationController, movie: Film) {
    self.navController = navController
    self.movie = movie
  }
  
  func start() {
    let detailsVC = DetailsAssembler(movie: movie).assembly()
    detailsVC.coordinator = self
    navController.pushViewController(detailsVC, animated: true)
  }
}
