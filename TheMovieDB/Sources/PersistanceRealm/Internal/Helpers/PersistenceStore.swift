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
}
