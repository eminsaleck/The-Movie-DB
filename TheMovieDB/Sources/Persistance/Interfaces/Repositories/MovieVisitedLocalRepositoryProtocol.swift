//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Combine
import Common

public protocol MovieVisitedLocalRepositoryProtocol {
  func saveMovie(id: Int, pathImage: String) -> AnyPublisher<Void, ErrorEnvelope>

  func fetchVisitedMovies() -> AnyPublisher<[MovieVisited], ErrorEnvelope>

  func recentVisitedShowsDidChange() -> AnyPublisher<Bool, Never>
}
