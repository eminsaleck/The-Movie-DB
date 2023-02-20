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
}

enum ResultsSectionItem: Hashable {
    case recentSearchs(search: String, date: Date)
    case results(items: MovieCellViewModel)
}
