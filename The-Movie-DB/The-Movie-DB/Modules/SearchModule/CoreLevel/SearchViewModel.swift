//
//  FavouriteViewModel.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 09.11.2022.
//

import Foundation

protocol SearchViewModelProtocol {
    func getData() -> [Film]
}

final class SearchViewModel: SearchViewModelProtocol {
  
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func getData() -> [Film]{
        var films = [Film]()
//        networkManager.fetchDiscoverMovies { [weak self] result in
//            switch result {
//            case .success(let filmArray):
//                films = filmArray
//            case .failure(_):
//                print("fail")
//            }
//        }
        return films
    }
    
}
