//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 13.02.2023.
//

import Combine

protocol ResultsViewModelDelegate: AnyObject {
    func resultsSearchViewModel(_ resultsViewModel: ResultsViewModelProtocol,
                                selectedMovie id: Int)
    
    func resultsSearchViewModel(_ resultsViewModel: ResultsViewModelProtocol,
                                recentSearchSelected query: String)
}

protocol ResultsViewModelProtocol {
    // MARK: - Input
    func willDisplayItem()
    func recentSearchIsPicked(query: String)
    func movieIsPicked(id: Int)
    func searchMovie(with query: String)
    func resetSearch()
    
    // MARK: - Output
    var viewState: CurrentValueSubject<ResultViewState, Never> { get }
    var layout: CurrentValueSubject<Bool, Never> { get }
    var dataSource: CurrentValueSubject<[ResultsSectionModel], Never> { get }
    var delegate: ResultsViewModelDelegate? { get set }
    func getViewState() -> ResultViewState
}

enum ResultViewState: Equatable {
    case initial
    case empty
    case loading
    case populated
    case error(String)
//    case paging([Entity], next: Int)
    
    static func == (lhs: ResultViewState, rhs: ResultViewState) -> Bool {
        switch (lhs, rhs) {
        case (.initial, .initial):
            return true
            
        case (.empty, .empty):
            return true
            
        case (.loading, .loading):
            return true
            
        case (.populated, .populated):
            return true
            
        case (.error, .error):
            return true
            
        default:
            return false
        }
    }
//    
//    var currentPage: Int {
//        switch self {
//        case .loading, .populated, .empty, .error:
//            return 1
//        case .paging(_, let page):
//            return page
//        }
//    }
//
//    var isInitialPage: Bool {
//        return currentPage == 1
//    }
}
