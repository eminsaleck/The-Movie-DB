//
//  MainCoordinator.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 28.10.2022.
//

import UIKit

protocol MainFlow {
    func coordinateToDetails(with movie: Film, navigationController: UINavigationController)
    func coordinateToAll() 
}

final class MainCoordinator: MainFlow {
    
    var navigationController: UINavigationController
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainVC = MainAssembler().assembly()
        mainVC.viewModel.coordinator = self
        navigationController.pushViewController(mainVC, animated: false)
    }
}

extension MainCoordinator{
    func openMain() -> MainViewController {
        let mainVC = MainAssembler().assembly()
        mainVC.viewModel.coordinator = self
        return mainVC
    }
    
    func coordinateToDetails(with movie: Film, navigationController: UINavigationController) {
        DetailsCoordinator(navigationController, movie: movie).start()
    }
    func coordinateToAll() {
        print("coordinateToAll")
       // DetailsCoordinator(navigationController, movie: movie).start()
    }
}
 
