//
//  CDMovieSearch.swift
//  CoreDataInfrastructure
//
//  Created by LEMIN DAHOVICH on 08.12.2022.
//

import CoreData
import Domain

final class CDMovieSearch: NSManagedObject {

    @NSManaged private(set) var id: String
    @NSManaged private(set) var searchText: String
    @NSManaged private(set) var createdAt: Date

    static func insert(into context: NSManagedObjectContext, searchText: String) -> CDMovieSearch {
        let movieSearch: CDMovieSearch = context.insertObject()
        movieSearch.id = UUID().uuidString
        movieSearch.searchText = searchText
        movieSearch.createdAt = Date()
        return movieSearch
    }

}

extension CDMovieSearch: DomainConvertible {

    func asDomain() -> MovieSearch {
        return MovieSearch(id: id, searchText: searchText, createdAt: createdAt)
    }

}

extension CDMovieSearch: Managed {

    static var defaultSortDescriptors: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(createdAt), ascending: false)]
    }

}
