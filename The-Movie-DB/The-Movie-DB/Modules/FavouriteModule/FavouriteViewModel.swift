//
//  FavouriteViewModel.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 09.11.2022.
//

import Foundation

protocol FavouriteViewModelProtocol {
    func getData() -> [Film]
}

final class FavouriteViewModel: FavouriteViewModelProtocol {
  
    private let networkManager: NetworkManagerProtocol
    private let dataManager: StorageManagerProtocol!
    
    init(networkManager: NetworkManagerProtocol, dataManager: StorageManagerProtocol) {
        self.networkManager = networkManager
        self.dataManager = dataManager
    }
    
    func getData() -> [Film]{
         var films = [Film]()
        return films
//        dataManager.getFilms()
    }
    
}

