//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 13.02.2023.
//

import Foundation
import UI

enum ResultsSectionModel: Hashable {
  case recentSearchs(items: [ResultsSectionItem])
  case results(items: [ResultsSectionItem])

  var section: ResultsSectionView {
    switch self {
    case .recentSearchs:
      return .recentSearch
    case .results:
      return .results
    }
  }

  var items: [ResultsSectionItem] {
    switch self {
    case let .recentSearchs(items):
      return items
    case let .results(items):
      return items
    }
  }
}

enum ResultsSectionView: Hashable {
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

enum ResultsSectionItem: Hashable {
  case recentSearchs(items: String)
  case results(items: MovieCellViewModel)
}
