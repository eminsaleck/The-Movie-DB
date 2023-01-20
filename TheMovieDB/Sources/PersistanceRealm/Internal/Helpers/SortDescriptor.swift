//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 20.01.2023.
//

import RealmSwift

class SortDescriptor {
    var key: String
    var ascending: Bool
    
    init(key: String, ascending: Bool) {
        self.key = key
        self.ascending = ascending
    }
}

extension SortDescriptor {
    var realmSortDescriptor: RealmSwift.SortDescriptor {
        return RealmSwift.SortDescriptor(keyPath: key, ascending: ascending)
    }
}

extension Array where Element == SortDescriptor {
    var realmSortDescriptors: [RealmSwift.SortDescriptor] {
        return self.map { $0.realmSortDescriptor }
    }
}
