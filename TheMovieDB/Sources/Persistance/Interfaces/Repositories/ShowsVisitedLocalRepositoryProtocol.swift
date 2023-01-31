//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Combine
import Common

public protocol MovieVisitedLocalRepositoryProtocol {
  func saveShow(id: Int, pathImage: String) -> AnyPublisher<Void, ErrorEnvelope>

  func fetchVisitedShows() -> AnyPublisher<[MovieVisited], ErrorEnvelope>

  func recentVisitedShowsDidChange() -> AnyPublisher<Bool, Never>
}
