//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 31.01.2023.
//


import UI

enum ResultSectionModel: Hashable {
  case recentSearchs(items: [ResultSectionModelItem])
  case results(items: [ResultSectionModelItem])

  var section: ResultSearchSectionView {
    switch self {
    case .recentSearchs:
      return .recentSearch
    case .results:
      return .results
    }
  }

  var items: [ResultSectionModelItem] {
    switch self {
    case let .recentSearchs(items):
      return items
    case let .results(items):
      return items
    }
  }
}

enum ResultSearchSectionView: Hashable {
  case recentSearch
  case results

  var header: String? {
    switch self {
    case .recentSearch:
      return Localized.searchResultsRecentSearchsTitle.localized()
    default:
      return nil
    }
  }
}

enum ResultSectionModelItem: Hashable {
  case recentSearchs(items: String)
  case results(items: MovieCellViewModel)
}
