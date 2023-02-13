//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 13.02.2023.
//

import Foundation
import UI

enum SearchPopularSectionModel {
  case movies(items: [SearchSectionItem])

  var sectionView: SearchPopularSectionView {
    switch self {
    case .movies:
      return .movies
    }
  }

  var items: [SearchSectionItem] {
    switch self {
    case let .movies(items):
      return items
    }
  }
}

enum SearchPopularSectionView: Hashable {
  case movies

  var header: String? {
    switch self {
    case .movies:
      return Localized.searchSectionGenresTitle.localized()
    }
  }
}

enum SearchSectionItem: Hashable {
  case movies(items: PopularMoviesViewModel)
}
