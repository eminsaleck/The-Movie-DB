//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Combine
import Common

public protocol SearchLocalRepositoryProtocol {
  func saveSearch(query: String) -> AnyPublisher<Void, ErrorEnvelope>
  func fetchRecentSearches() -> AnyPublisher<[Search], ErrorEnvelope>
}
