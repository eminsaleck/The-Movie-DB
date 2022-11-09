//
//  FavouriteAssembler.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 08.11.2022.
//


import Foundation

final class FavouriteAssembler: AssemblerProtocol {
  
  func assembly() -> FavouriteController {
    let favouriteController = FavouriteController()
    let favouriteViewModel = FavouriteViewModel()
    favouriteController.viewModel = favouriteViewModel
    return favouriteController
  }
}
