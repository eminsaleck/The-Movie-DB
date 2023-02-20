//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Combine
import Common

public final class SearchLocalRepository {
  private let dataSource: SearchLocalDataSource
  private let loggedUserRepository: LoggedUserRepositoryProtocol

  public init(dataSource: SearchLocalDataSource, loggedUserRepository: LoggedUserRepositoryProtocol) {
    self.dataSource = dataSource
    self.loggedUserRepository = loggedUserRepository
  }
}

extension SearchLocalRepository: SearchLocalRepositoryProtocol {
  public func saveSearch(query: String) -> AnyPublisher<Void, ErrorEnvelope> {
    let userId = loggedUserRepository.getUser()?.id ?? 0
    return dataSource.saveSearch(query: query, userId: userId)
  }

  public func fetchRecentSearches() -> AnyPublisher<[Search], ErrorEnvelope> {
    let userId = loggedUserRepository.getUser()?.id ?? 0
    return dataSource.fetchRecentSearches(userId: userId)
      .map {
          return $0.map { searchDLO in
              Search(query: searchDLO.query, date: searchDLO.date)
          }
      }
      .eraseToAnyPublisher()
  }
}
