//
//  CDGenre.swift
//  CoreDataInfrastructure
//
//  Created by LEMIN DAHOVICH on 08.12.2022.
//

import CoreData
import Domain

final class CDGenre: NSManagedObject {

    @NSManaged private(set) var id: Int
    @NSManaged private(set) var name: String

    static func insert(into context: NSManagedObjectContext, id: Int, name: String) -> CDGenre {
        let genre: CDGenre = context.insertObject()
        genre.id = id
        genre.name = name
        return genre
    }

}

// MARK: - DomainConvertible

extension CDGenre: DomainConvertible {

    func asDomain() -> Genre {
        return Genre(id: id, name: name)
    }

}

// MARK: - Managed

extension CDGenre: Managed {

    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(name), ascending: true)]
    }

}
