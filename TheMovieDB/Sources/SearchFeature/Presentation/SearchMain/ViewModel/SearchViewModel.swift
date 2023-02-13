//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 13.02.2023.
//


import Combine

final class SearchViewModel {
    
    var resultsViewModel: ResultsViewModelProtocol?
    
    weak var coordinator: SearchCoordinatorProtocol?
    
    let searchBarTextSubject: CurrentValueSubject<String, Never> = .init("")
    
    init() { }
    
    
    fileprivate func navigateWith(state: SearchState) {
        coordinator?.navigate(with: state)
    }
}

extension SearchViewModel: SearchPopularViewModelDelegate {
    func searchPopularViewModel(_ searchPopularViewModel: SearchPopularViewModel, popularMoviePicked id: Int) {
        navigateWith(state: .movieIsPicked(id: id))
    }
}

extension SearchViewModel: ResultsViewModelDelegate {
    func resultsSearchViewModel(_ resultsViewModel: ResultsViewModelProtocol, selectedMovie id: Int) {
        print(id)
    }
    
    func resultsSearchViewModel(_ resultsViewModel: ResultsViewModelProtocol, recentSearchSelected query: String) {
        print(query)
    }
}
