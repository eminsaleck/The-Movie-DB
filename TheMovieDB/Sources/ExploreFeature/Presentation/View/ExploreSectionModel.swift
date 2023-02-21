//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Foundation
import UI
import Common

enum ExploreSectionModel {
  case genres(genres: [GenreMovies], headerViewModels: [SectionHeaderViewModel])

  var sectionView: ExploreSectionView {
    switch self {
    case .genres:
      return .genres
    }
  }

  var items: [ExploreSectionItem] {
    switch self {
    case let .genres(genres, headerViewModels):
      var items: [ExploreSectionItem] = []
      for (index, genre) in genres.enumerated() {
        let headerViewModel = headerViewModels[index]
        items.append(.header(headerViewModel))
        let movieViewModels = genre.movies.map(MovieCellViewModel.init)
        items.append(contentsOf: movieViewModels.map(ExploreSectionItem.movie))
      }
      return items
    }
  }
}

enum ExploreSectionItem: Hashable {
  case header(SectionHeaderViewModel)
  case movie(MovieCellViewModel)
}

enum ExploreSectionView: Hashable {
  case genres

  var header: String? {
    switch self {
    case .genres:
      return Localized.sectionGenreTitle.localized()
    }
  }
}
