//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 20.01.2023.
//

import Foundation
import RealmSwift

extension PersistenceStore where Entity == RealmShowVisited {
    
    func delete(showId: Int) {
        do {
            let showVisited = realm.objects(RealmShowVisited.self).filter("id == %@", showId)
            try realm.write {
                realm.delete(showVisited)
            }
        } catch { }
    }
    
    func insert(id: Int, pathImage: String, userId: Int) {
        let showVisited = RealmShowVisited()
        showVisited.id = id
        showVisited.pathImage = pathImage
        showVisited.userId = userId
        showVisited.createdAt = Date()
        try! realm.write {
            realm.add(showVisited)
        }
    }
    
    func findAll(for userId: Int) -> [RealmShowVisited] {
        let showVisited = realm.objects(RealmShowVisited.self).filter("userId == %@", userId)
        return Array(showVisited)
    }
    
    func deleteLimitStorage(userId: Int, until limit: Int) {
        let showVisited = realm.objects(RealmShowVisited.self).filter("userId == %@", userId).sorted(byKeyPath: "createdAt", ascending: false)
        guard limit > 0 else { return }
        let range = limit..<showVisited.count
        try! realm.write {
            realm.delete(showVisited[range])
        }
    }
}
