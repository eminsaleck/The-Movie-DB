//
//  MainNetworkViewModel.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 08.11.2022.
//

import Foundation
import RxSwift

protocol MainNetworkViewModelProtocol{
    func fetchMoviesViewModels(genre: Genre, completion: @escaping ([Film]) -> ())
}

final class MainNetworkViewModel: MainNetworkViewModelProtocol{

    var coordinator: MainFlow!
    var dataArray: [Film] = []
   
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol){
        self.networkManager = networkManager
    }
    

    func fetchMoviesViewModels(genre: Genre, completion: @escaping ([Film]) -> ()) {
        networkManager.fetchMovieListByGenre(genre: genre.id) { result in
            switch result{
            case .success(let items):
                completion(items)
            case .failure(_):
                print(result)
            }
        }
        
    }
}
