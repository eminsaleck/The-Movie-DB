//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 20.01.2023.
//

import Foundation
import Combine
import RealmSwift
import Persistance
import Common

final class RealmShowVisitedStorage {
  private let store: PersistenceStore<RealmShowVisited>
  private let recentsShowsSubject = CurrentValueSubject<Bool, Never>(true)
  private let limitStorage: Int

  init(limitStorage: Int, store: PersistenceStore<RealmShowVisited>) {
    self.limitStorage = limitStorage
    self.store = store
      self.store.configureResultsController(sortDescriptors: RealmShowVisited.getDefaultSortDescriptors(), notifyChangesOn: <#[RealmCollectionChange<Results<RealmShowVisited>>]#>)
    self.store.delegate = self
  }
}

extension RealmShowVisitedStorage: ShowsVisitedLocalDataSource {

  public func saveShow(id: Int, pathImage: String, userId: Int) -> AnyPublisher<Void, ErrorEnvelope> {
    return Deferred { [store, limitStorage] in
      return Future<Void, ErrorEnvelope> { promise in
        store.delete(showId: id)
        store.deleteLimitStorage(userId: userId, until: limitStorage)
        store.insert(id: id, pathImage: pathImage, userId: userId)
        promise(.success(()))
      }
    }
    .eraseToAnyPublisher()
  }

  public func fetchVisitedShows(userId: Int) -> AnyPublisher<[ShowVisitedDLO], ErrorEnvelope> {
    return Deferred { [store] in
      return Future<[ShowVisitedDLO], ErrorEnvelope> { promise in
        let results = store.findAll(for: userId).map { $0.toDomain() }
        promise(.success(results))
      }
    }
    .eraseToAnyPublisher()
  }

  public func recentVisitedShowsDidChange() -> AnyPublisher<Bool, Never> {
    return recentsShowsSubject.eraseToAnyPublisher()
  }
}

// MARK: - PersistenceStoreDelegate
extension RealmShowVisitedStorage: PersistenceStoreDelegate {
  func persistenceStore(didUpdateEntity update: Bool) {
    recentsShowsSubject.send(update)
  }
}
