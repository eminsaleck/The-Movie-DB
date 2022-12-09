//
//  CDMovieVisit.swift
//  CoreDataInfrastructure
//
//  Created by LEMIN DAHOVICH on 08.12.2022.
//

import CoreData
import Domain

final class CDMovieVisit: NSManagedObject {

    @NSManaged private(set) var id: Int
    @NSManaged private(set) var title: String
    @NSManaged private(set) var posterPath: String
    @NSManaged private(set) var createdAt: Date

    static func insert(into context: NSManagedObjectContext, id: Int, title: String, posterPath: String) -> CDMovieVisit {
        let movieVisit: CDMovieVisit = context.insertObject()
        movieVisit.id = id
        movieVisit.title = title
        movieVisit.posterPath = posterPath
        movieVisit.createdAt = Date()
        return movieVisit
    }

}

// MARK: - DomainConvertible

extension CDMovieVisit: DomainConvertible {

    func asDomain() -> MovieVisit {
        return MovieVisit(id: id,
                          title: title,
                          posterPath: posterPath,
                          createdAt: createdAt)
    }

}

// MARK: - Managed

extension CDMovieVisit: Managed {

    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(createdAt), ascending: false)]
    }

}
