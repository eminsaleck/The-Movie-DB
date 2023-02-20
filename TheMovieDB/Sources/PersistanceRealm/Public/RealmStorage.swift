//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import RealmSwift

public final class RealmStorage {
    
    public static let shared = RealmStorage()
    
    private init() { }
    
    lazy var realm: Realm = {
        do {
            return try Realm()
        } catch {
            fatalError("RealmStorage Unresolved error \(error)")
        }
    }()
}
