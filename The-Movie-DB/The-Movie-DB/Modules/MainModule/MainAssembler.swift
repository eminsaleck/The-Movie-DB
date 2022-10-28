//
//  MainAssembler.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 28.10.2022.
//

import Foundation

final class MainAssembler: AssemblerProtocol {
    
  func assembly() -> MainController {
    let movieListViewModel = MovieListViewModel()
    let mainController = MainController()
      mainController.viewModel = movieListViewModel
    
    return mainController
  }
}
