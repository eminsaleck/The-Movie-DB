//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 31.01.2023.
//

import Combine

import Foundation

protocol ResultsViewModelDelegate: AnyObject {
  func resultsSearchViewModel(_ resultsViewModel: ResultsViewModelProtocol,
                              didSelectShow idShow: Int)

  func resultsSearchViewModel(_ resultsViewModel: ResultsViewModelProtocol,
                              didSelectRecentSearch query: String)
}


protocol ResultsViewModelProtocol {
  func recentSearch(query: String)
  func movie(index: Int)
  func searchMovie(with query: String)
  func resetSearch()

  var viewState: CurrentValueSubject<ResultViewState, Never> { get }
  var dataSource: CurrentValueSubject<[ResultSectionModel], Never> { get }
  var delegate: ResultsViewModelDelegate? { get set }
  func getViewState() -> ResultViewState
}

// MARK: - View State
enum ResultViewState: Equatable {
  case initial
  case empty
  case loading
  case populated
  case error(String)

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
}
