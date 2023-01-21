//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Persistance

public protocol LocalDataSourceProtocol {
  func getShowVisitedDataSource(limitStorage: Int) -> ShowsVisitedLocalDataSource
  func getRecentSearchesDataSource() -> SearchLocalDataSource
}

final public class LocalStorage: LocalDataSourceProtocol {
  private let realmStorage: RealmStorage

  public init(realmStorage: RealmStorage) {
    self.realmStorage = realmStorage
  }

  public func getShowVisitedDataSource(limitStorage: Int) -> ShowsVisitedLocalDataSource {
    let store: PersistenceStore<RealmShowVisited> = PersistenceStore(realmStorage.realm)
    return RealmShowVisitedStorage(limitStorage: limitStorage, store: store)
  }

  public func getRecentSearchesDataSource() -> SearchLocalDataSource {
    let store: PersistenceStore<RealmRecentSearch> = PersistenceStore(realmStorage.realm)
    return RealmSearchQueriesStorage(store: store)
  }
}
