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
    
    private var realm: Realm
    weak var delegate: PersistenceStoreDelegate?
    
    init(_ realm: Realm) {
        self.realm = realm
        super.init()
    }
    
    
    func configureResultsController(predicate: String? = nil,
                                    sortDescriptors: [SortDescriptor] = [],
                                    notifyChangesOn changeTypes: [RealmCollectionChange<Results<Entity>>]) {
        var results = realm.objects(Entity.self)
        if let predicateString = predicate {
            results = results.filter(predicateString)
        }
        results = results.sorted(by: sortDescriptors)

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
