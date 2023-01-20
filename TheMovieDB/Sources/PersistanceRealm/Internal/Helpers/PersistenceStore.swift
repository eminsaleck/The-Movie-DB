//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Foundation
import RealmSwift

protocol PersistenceStoreDelegate: AnyObject {
  func persistenceStore(didUpdateEntity update: Bool)
}

class PersistenceStore<Entity: Object>: NSObject {

  public var realm: Realm
  weak var delegate: PersistenceStoreDelegate?

  init(_ realm: Realm) {
    self.realm = realm
    super.init()
  }

  func configureResultsController(predicate: NSPredicate? = nil,
                                  sortDescriptors: [SortDescriptor] = [],
                                  notifyChangesOn changeTypes: [RealmCollectionChange<Results<Entity>>]) {
    let results = realm.objects(Entity.self).filter(predicate).sorted(by: sortDescriptors)

    results.observe(delegate, options: changeTypes)
  }

  // MARK: - NSFetchedResultsControllerDelegate
  public func controller(_ controller: Results<Entity>,
                         didChange anObject: Entity,
                         at indexPath: IndexPath?,
                         for type: RealmCollectionChange<Results<Entity>>) {
    delegate?.persistenceStore(didUpdateEntity: true)
  }
}
