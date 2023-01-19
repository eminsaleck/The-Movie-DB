//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Realm
import RealmSwift

public final class RealmStorage {

  public static let shared = RealmStorage()

  public init() { }

  lazy var realm: Realm = {
    do {
        let realm = try Realm()
        return realm
    } catch let error as NSError {
        assertionFailure("Realm Unresolved error \(error), \(error.userInfo)")
    }
    return
  }()
}
