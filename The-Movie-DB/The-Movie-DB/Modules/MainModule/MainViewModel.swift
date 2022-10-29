//
//  MovieListViewModel.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 28.10.2022.
//

import Foundation
import RxSwift

final class MainViewModel{
    
    var dataArray: [Displayable] = []
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()){
        self.networkManager = networkManager
    }

    func fetchMoviesViewModels() -> Observable<[Film]> {
        networkManager.fetchMovies(pagination: false).map { $0.map {
            $0  } }
    }
}
