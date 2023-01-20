//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 20.01.2023.
//

import Foundation
import RealmSwift
import Persistance

final class RealmShowVisited: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var createdAt = Date()
    @objc dynamic var pathImage = ""
    @objc dynamic var userId: Int = 0
    
    static func insert(into realm: Realm, showId: Int, pathImage: String, userId: Int) -> RealmShowVisited {
        let showVisited = RealmShowVisited()
        showVisited.id = showId
        showVisited.createdAt = Date()
        showVisited.pathImage = pathImage
        showVisited.userId = userId
        try! realm.write {
            realm.add(showVisited)
        }
        return showVisited
    }
}

extension RealmShowVisited {
    func toDomain() -> ShowVisitedDLO {
        return ShowVisitedDLO(id: id, pathImage: pathImage)
    }
}

extension RealmShowVisited {
    static func getDefaultSortDescriptors() -> [SortDescriptor] {
        return [SortDescriptor(key: "createdAt", ascending: false)]
    }
}
