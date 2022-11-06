//
//  MovieListViewModel.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 28.10.2022.
//

import Foundation
import RxSwift

protocol MainViewModelProtocol{
    func fetchMoviesViewModels() -> [Film]
    var coordinator: MainFlow! { get set }
    var dataArray: [Film] { get set }

}

final class MainViewModel: MainViewModelProtocol{
    
    var coordinator: MainFlow!
    var dataArray: [Film] = []
   
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol){
        self.networkManager = networkManager
    }
    

    func fetchMoviesViewModels() -> [Film] {
        for genre in Genre.allCases{
            networkManager.fetchMovieListByGenre(genre: genre.id) { result in
                result.map { filmArr in
                    return filmArr
                }
            }
        }
        return [Film]()
    } 
}
