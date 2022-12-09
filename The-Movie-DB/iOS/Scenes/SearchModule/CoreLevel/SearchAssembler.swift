//
//  FavouriteAssembler.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 08.11.2022.
//


import Foundation

final class SearchAssembler: AssemblerProtocol {
    
    func assembly() -> SearchController {
        let searchController = SearchController()
        let networkManager = NetworkManager()
        let searchViewModel = SearchViewModel(networkManager: networkManager)
        searchController.viewModel = searchViewModel
        return searchController
    }
}
