//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 20.01.2023.
//

import Foundation
import RealmSwift

extension PersistenceStore where Entity == RealmRecentSearch {
    
    func delete(query: String) {
        let predicate = NSPredicate(format: "%K = %@", #keyPath(RealmRecentSearch.query), query)
        let recentSearches = realm.objects(RealmRecentSearch.self).filter(predicate)
        try! realm.write {
            realm.delete(recentSearches)
        }
    }
    
    func insert(query: String, userId: Int) {
        try! realm.write {
            let recentSearch = RealmRecentSearch()
            recentSearch.id = UUID().uuidString
            recentSearch.query = query
            recentSearch.userId = userId
            recentSearch.createdAt = Date()
            realm.add(recentSearch)
        }
    }
    
    func findAll(userId: Int) -> Results<RealmRecentSearch> {
        return realm.objects(RealmRecentSearch.self).filter("userId = %d", userId).sorted(byKeyPath: "createdAt", ascending: false)
    }
}
