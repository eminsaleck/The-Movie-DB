//
//  PersistenceStore+Genre.swift
//  CoreDataInfrastructure
//
//  Created by LEMIN DAHOVICH on 08.12.2022.
//

import Foundation
import Domain

extension PersistenceStore where Entity == CDGenre {

    func saveGenre(_ genre: Genre, completion: ((Bool) -> Void)? = nil) {
        managedObjectContext.performChanges {
            _ = CDGenre.insert(into: self.managedObjectContext,
                           id: genre.id,
                           name: genre.name)
            completion?(true)
        }
    }

    func find(with id: Int) -> CDGenre? {
        let predicate = NSPredicate(format: "id == %d", id)
        return CDGenre.findOrFetch(in: managedObjectContext, matching: predicate)
    }

    func findAll() -> [CDGenre] {
        return CDGenre.fetch(in: managedObjectContext)
    }

}
