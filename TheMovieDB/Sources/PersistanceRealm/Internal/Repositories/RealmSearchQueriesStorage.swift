//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 20.01.2023.
//

import Combine
import Foundation
import RealmSwift
import Persistance
import Common

final class RealmSearchQueriesStorage {
  private let store: PersistenceStore<RealmRecentSearch>

  public init(store: PersistenceStore<RealmRecentSearch>) {
    self.store = store
  }
}

extension RealmSearchQueriesStorage: SearchLocalDataSource {

  public func saveSearch(query: String, userId: Int) -> AnyPublisher<Void, ErrorEnvelope> {
      return Deferred { [store] in
            return Future<Void, ErrorEnvelope> { promise in
              store.delete(query: query)
              store.insert(query: query, userId: userId)
              promise(.success(()))
            }
          }
          .eraseToAnyPublisher()
  }

  public func fetchRecentSearches(userId: Int) -> AnyPublisher<[SearchDLO], ErrorEnvelope> {
    return Deferred { [store] in
      return Future<[SearchDLO], ErrorEnvelope> { promise in
          let results = store.findAll(userId: userId).map { $0.toDomain }
        promise(.success(results))
      }
    }
    .eraseToAnyPublisher()
  }
}
