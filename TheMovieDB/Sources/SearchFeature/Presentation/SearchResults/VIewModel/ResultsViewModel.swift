//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 16.02.2023.
//
import Foundation
import Combine
import Common
import UI
import Persistance

final class ResultsViewModel: ResultsViewModelProtocol {
    
    private let searchTVShowsUseCase: SearchMovieUseCase
    private let fetchRecentSearchesUseCase: FetchSearchesUseCase
    private let currentSearchSubject = CurrentValueSubject<String, Never>("")
    
    let viewState  = CurrentValueSubject<ResultViewState, Never>(.initial)
    let dataSource = CurrentValueSubject<[ResultsSectionModel], Never>([])
    
    weak var delegate: ResultsViewModelDelegate?
    private var disposeBag = Set<AnyCancellable>()
    
    private var currentResult: [MoviePage.Movie] = []
    
    // MARK: - Init
    init(searchTVShowsUseCase: SearchMovieUseCase,
         fetchRecentSearchesUseCase: FetchSearchesUseCase
    ) {
        self.searchTVShowsUseCase = searchTVShowsUseCase
        self.fetchRecentSearchesUseCase = fetchRecentSearchesUseCase
    }
    
    func recentSearchIsPicked(query: String) {
        //
    }
    
    func showIsPicked(index: Int) {
        //
    }
    
    func searchShows(with query: String) {
        //
    }
    
    func resetSearch() {
        //
    }
    
    func getViewState() -> ResultViewState {
      return viewState.value
    }
}
