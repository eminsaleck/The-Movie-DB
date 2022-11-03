//
//  DetailCoordinator.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 29.10.2022.
//
import UIKit

protocol DetailsCoordinatorProtocol{
    
}

final class DetailsCoordinator: DetailsCoordinatorProtocol{
    
    var navigationController: UINavigationController
    var movie: Film!
    
    init(_ navigationController: UINavigationController, movie: Film){
        self.navigationController = navigationController
        self.movie = movie
    }

    func start() {
        let detailVC = DetailsAssembler(movie: movie).assembly()
        detailVC.viewModel.coordinator = self
        navigationController.pushViewController(detailVC, animated: true)
    }
    
    
    
}
