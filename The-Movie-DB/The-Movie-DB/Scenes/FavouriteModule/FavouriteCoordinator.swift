//
//  Favourite.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 08.11.2022.
//
import UIKit

protocol FavouriteCoordinatorFlow {
    func coordinateToDetails(with movie: Film, navigationController: UINavigationController)
}

final class FavouriteCoordinator: FavouriteCoordinatorFlow {
  
  let navController: UINavigationController
  
  init(_ navController: UINavigationController) {
    self.navController = navController
  }
  
  func start() {
    let favController = FavouriteAssembler().assembly()
    favController.coordinator = self
    navController.pushViewController(favController, animated: true)      
  }
}

extension FavouriteCoordinator{
    func coordinateToDetails(with movie: Film, navigationController: UINavigationController) {
        DetailsCoordinator(navigationController, movie: movie).start()
    }
}
