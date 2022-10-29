//
//  DetailCoordinator.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 29.10.2022.
//

import UIKit

protocol DetailsCoordinatorFlow { }

final class DetailCoordinator: CoordinatorProtocol, DetailsCoordinatorFlow {
    
    let movie: Film
    
    init(movie: Film) {
        self.movie = movie
        
    }
    
    func start() {
        let detailsVC = DetailsAssembler(movie: movie).assembly()
        print("safr")
        detailsVC.coordinator = self
    }

}
