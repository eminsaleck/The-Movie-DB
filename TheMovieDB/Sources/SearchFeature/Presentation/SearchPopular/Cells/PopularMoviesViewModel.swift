//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 13.02.2023.
//

import Foundation
import Common

protocol PopularViewModelProtocol {
  var id: Int { get }
  var name: String { get }
}

final class PopularMoviesViewModel: PopularViewModelProtocol, Hashable {
  let id: Int
  let name: String
  private let movie: Movie

  public init(movie: Movie) {
    self.movie = movie
    id = movie.id
    name = movie.name
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }

  static func == (lhs: PopularMoviesViewModel, rhs: PopularMoviesViewModel) -> Bool {
    return lhs.id == rhs.id
  }
}
