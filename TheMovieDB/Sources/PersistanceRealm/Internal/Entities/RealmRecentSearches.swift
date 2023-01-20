//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 20.01.2023.
//

import Foundation
import RealmSwift
import Persistance

final class RealmRecentSearch: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var query: String = ""
    @objc dynamic var createdAt: Date = Date()
    @objc dynamic var userId: Int = 0
    
    static func insert(into realm: Realm, query: String, userId: Int) -> RealmRecentSearch {
        let recentSearch = RealmRecentSearch()
        recentSearch.query = query
        recentSearch.userId = userId
        recentSearch.createdAt = Date()
        try! realm.write {
            realm.add(recentSearch)
        }
        return recentSearch
    }
}

extension RealmRecentSearch {
    func toDomain() -> SearchDLO {
        return SearchDLO(query: query)
    }
}

extension RealmRecentSearch {
    static func getDefaultSortDescriptors() -> [SortDescriptor] {
        return [SortDescriptor(key: "createdAt", ascending: false)]
    }
}
