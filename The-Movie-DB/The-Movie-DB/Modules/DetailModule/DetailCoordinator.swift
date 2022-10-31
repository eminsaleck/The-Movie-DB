//
//  DetailCoordinator.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 29.10.2022.
//

import UIKit

protocol DetailsCoordinatorFlow {
}

final class DetailCoordinator: CoordinatorProtocol, DetailsCoordinatorFlow {
    let navController: UINavigationController

    let movie: Film
    
    init(navController: UINavigationController, movie: Film) {
        self.movie = movie        
        self.navController = navController
    }
    
    func start() {
        let detailsVC = DetailsAssembler(movie: movie).assembly()
        detailsVC.coordinator = self
        navController.pushViewController(detailsVC, animated: false)
    }
    func openHome(movie: Film) -> DetailViewController {
      let detailViewController = DetailsAssembler(movie: movie).assembly()
        detailViewController.coordinator = self
      return detailViewController
    }

}
