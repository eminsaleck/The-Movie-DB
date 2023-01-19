//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import RealmSwift
import Foundation

class RealmStore<T: Object> {
    private let realm: Realm
    private let objectType: T.Type

    init(_ realm: Realm) {
        self.realm = realm
        self.objectType = T.self
    }

    func save(object: T) {
        try? realm.write {
            realm.add(object, update: .modified)
        }
    }

    func save(objects: [T]) {
        try? realm.write {
            realm.add(objects, update: .modified)
        }
    }

    func delete(object: T) {
        try? realm.write {
            realm.delete(object)
        }
    }

    func delete(objects: [T]) {
        try? realm.write {
            realm.delete(objects)
        }
    }

    func fetchAll() -> Results<T> {
        return realm.objects(objectType)
    }

    func fetch(with predicate: NSPredicate) -> Results<T> {
        return realm.objects(objectType).filter(predicate)
    }
}
