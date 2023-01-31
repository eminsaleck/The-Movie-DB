//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 31.01.2023.
//

import Common
import UI

enum SearchOptionsSectionModel {
  case movieVisited(items: [SearchSectionItem])

  var sectionView: SearchOptionsSectionView {
    switch self {
    case .movieVisited:
      return .movieVisited

    }
  }

  var items: [SearchSectionItem] {
    switch self {
    case let .movieVisited(items):
      return items
    }
  }
}

enum SearchOptionsSectionView: Hashable {
  case movieVisited

  var header: String? {
    switch self {
    case .movieVisited:
      return Localized.searchSectionRecentTitle.localized()
    }
  }
}

enum SearchSectionItem: Hashable {
  case showsVisited(items: VisitedMovieViewModel)
}
