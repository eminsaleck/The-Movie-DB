//
//  MovieListViewModel.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 28.10.2022.
//

import Foundation
import RxSwift

protocol MainViewModelProtocol{
    func fetchMoviesViewModels() -> Observable<[Film]>
    var coordinator: MainFlow! { get set }
}

final class MainViewModel: MainViewModelProtocol{
    
    var coordinator: MainFlow!
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
