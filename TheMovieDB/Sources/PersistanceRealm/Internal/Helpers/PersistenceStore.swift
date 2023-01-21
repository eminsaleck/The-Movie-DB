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
    private var notificationToken: NotificationToken?
    weak var delegate: PersistenceStoreDelegate?
    
    init(_ realm: Realm) {
        self.realm = realm
        super.init()
    }
    
    func configureResultsController(predicate: NSPredicate? = nil,
                                    sortDescriptors: [SortDescriptor] = []) {
        let results = realm.objects(Entity.self).filter(predicate!)
        notificationToken = results.observe { [weak self] (changes: RealmCollectionChange) in
            switch changes {
            case .initial:
                break
            case .update(_, let deletions, let insertions, let modifications):
                if !deletions.isEmpty || !insertions.isEmpty || !modifications.isEmpty {
                    self?.delegate?.persistenceStore(didUpdateEntity: true)
                }
            case .error(let error):
                fatalError("\(error)")
            }
        }
    }
}
