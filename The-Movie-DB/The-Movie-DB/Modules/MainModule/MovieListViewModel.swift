//
//  MovieListViewModel.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 28.10.2022.
//

import Foundation
import RxSwift

final class MovieListViewModel{
    var dataArray: [Displayable] = []
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()){
        self.networkManager = networkManager
    }
    
    func fetchMoviesViewModels() -> Observable<[MovieViewModel]> {
        networkManager.fetchMovies(pagination: false).map { $0.map {
            MovieViewModel(movie: $0)  } }
    }
    
}
