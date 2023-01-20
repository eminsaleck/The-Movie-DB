//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Combine
import Common

public protocol SearchLocalDataSource {
  func saveSearch(query: String, userId: Int) -> AnyPublisher<Void, ErrorEnvelope>
  func fetchRecentSearches(userId: Int) -> AnyPublisher<[SearchDLO], ErrorEnvelope>
}
