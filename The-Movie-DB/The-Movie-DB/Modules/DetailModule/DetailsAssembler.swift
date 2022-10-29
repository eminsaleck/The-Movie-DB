//
//  DetailsAssembler.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 29.10.2022.
//

import Foundation

final class DetailsAssembler: AssemblerProtocol {
    
    
    let movie: Film
    
    init(movie: Film) {
        self.movie = movie
    }
    
    func assembly() -> DetailViewController {
        let detailsViewController = DetailViewController()
        let detailsViewModel = DetailViewModel()
        detailsViewModel.movie = movie
        print(movie.titleName)
        detailsViewController.viewModel = detailsViewModel
        return detailsViewController
    }
}
