//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Common

protocol GenreViewModelProtocol {
  var id: Int { get }
  var name: String { get }
}

final class GenreViewModel: GenreViewModelProtocol, Hashable {
  let id: Int
  let name: String
  private let genre: Genre

  public init(genre: Genre) {
    self.genre = genre
    id = genre.id
    name = genre.name
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }

  static func == (lhs: GenreViewModel, rhs: GenreViewModel) -> Bool {
    return lhs.id == rhs.id
  }
}

