//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Combine
import Common

public protocol MovieVisitedLocalDataSource {
  func saveShow(id: Int, pathImage: String, userId: Int) -> AnyPublisher<Void, ErrorEnvelope>

  func fetchVisitedShows(userId: Int) -> AnyPublisher<[MovieVisitedDLO], ErrorEnvelope>

  func recentVisitedShowsDidChange() -> AnyPublisher<Bool, Never>
}
