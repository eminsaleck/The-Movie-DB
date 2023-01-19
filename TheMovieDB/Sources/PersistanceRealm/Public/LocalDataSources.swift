//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//


import Persistance
import RealmSwift

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
    let store: RealmStore<ShowVisited> = RealmStore(realmStorage.realm)
    return RealmShowVisitedStorage(limitStorage: limitStorage, store: store)
  }

  public func getRecentSearchesDataSource() -> SearchLocalDataSource {
    let store: RealmStore<RecentSearch> = RealmStore(realmStorage.realm)
    return RealmSearchQueriesStorage(store: store)
  }
}
