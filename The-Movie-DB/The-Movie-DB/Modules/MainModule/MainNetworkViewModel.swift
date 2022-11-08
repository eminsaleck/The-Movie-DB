//
//  MainNetworkViewModel.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 08.11.2022.
//

import Foundation
import RxSwift

protocol MainNetworkViewModelProtocol{
    func reactiveFetch(genre: Genre) -> Observable<[Film]>
}

final class MainNetworkViewModel: MainNetworkViewModelProtocol{

    var coordinator: MainFlow!
    
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

}

extension MainNetworkViewModel{
    func reactiveFetch(genre: Genre) -> Observable<[Film]>{
        return networkManager.fetchMovieList(genre: genre.id)
    }
}
