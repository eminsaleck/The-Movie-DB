//
//  Favourite.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 08.11.2022.
//
import UIKit

protocol SearchCoordinatorFlow {
    func coordinateToDetails(with movie: Film, navigationController: UINavigationController)
}

final class SearchCoordinator: SearchCoordinatorFlow {
  
  let navController: UINavigationController
  
  init(_ navController: UINavigationController) {
    self.navController = navController
  }
  
  func start() {
    let searchController = SearchAssembler().assembly()
      searchController.coordinator = self
    navController.pushViewController(searchController, animated: true)
  }
}

extension SearchCoordinator{
    func coordinateToDetails(with movie: Film, navigationController: UINavigationController) {
        DetailsCoordinator(navigationController, movie: movie).start()
    }
}
