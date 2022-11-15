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
    private let dataManager: DataManagerProtocol
    
    init(networkManager: NetworkManagerProtocol, dataManager: DataManagerProtocol) {
        self.networkManager = networkManager
        self.dataManager = dataManager
    }
    
    func getData() -> [Film]{
        dataManager.getFilms()
    }
    
}

