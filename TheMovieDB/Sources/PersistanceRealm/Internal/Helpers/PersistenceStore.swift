//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import RealmSwift
import Foundation

protocol PersistenceStoreDelegate: AnyObject {
  func persistenceStore(didUpdateEntity update: Bool)
}

class PersistenceStore<Entity: Object>: RealmStore<Entity> {
    weak var delegate: PersistenceStoreDelegate?

    override func save(object: Entity) {
        super.save(object: object)
        delegate?.persistenceStore(didUpdateEntity: true)
    }

    override func save(objects: [Entities]) {
        super.save(objects: objects)
        delegate?.persistenceStore(didUpdateEntity: true)
    }

    override func delete(object: Entities) {
        super.delete(object: object)
        delegate?.persistenceStore(didUpdateEntity: true)
    }

    override func delete(objects: [Entities]) {
        super.delete(objects: objects)
        delegate?.persistenceStore(didUpdateEntity: true)
    }

}
