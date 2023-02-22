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
    
    let searchBarText: CurrentValueSubject<String, Never> = .init("")
    
    init() { }
    
    private func navigateWith(state: SearchState) {
        coordinator?.navigate(with: state)
    }
    
    func startSearch(with text: String) {
      resultsViewModel?.searchMovie(with: text)
    }

    func resetSearch() {
      resultsViewModel?.resetSearch()
    }
}

extension SearchViewModel: SearchPopularViewModelDelegate {
    func searchPopularViewModel(_ searchPopularViewModel: SearchPopularViewModel, popularMoviePicked id: Int) {
        navigateWith(state: .movieIsPicked(id: id))
        print(" PICKED - \(id)")
    }
}

extension SearchViewModel: ResultsViewModelDelegate {
    func resultsSearchViewModel(_ resultsViewModel: ResultsViewModelProtocol, selectedMovie id: Int) {
        navigateWith(state: .movieIsPicked(id: id))
        print(" PICKED - \(id)")
    }
    
    func resultsSearchViewModel(_ resultsViewModel: ResultsViewModelProtocol, recentSearchSelected query: String) {
        searchBarText.send(query)
        startSearch(with: query)
    }
}
