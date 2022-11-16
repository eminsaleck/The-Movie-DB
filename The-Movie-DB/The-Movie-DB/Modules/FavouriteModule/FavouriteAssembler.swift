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
      let networkManager = NetworkManager()
      let dataManager = StorageManager()
    let favouriteViewModel = FavouriteViewModel(networkManager: networkManager, dataManager: dataManager)
    favouriteController.viewModel = favouriteViewModel
    return favouriteController
  }
}

