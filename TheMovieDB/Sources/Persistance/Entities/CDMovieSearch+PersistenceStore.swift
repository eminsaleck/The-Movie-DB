//
//  PersistenceStore+MovieSearch.swift
//  CoreDataInfrastructure
//
//  Created by LEMIN DAHOVICH on 08.12.2022.
//

extension PersistenceStore where Entity == CDMovieSearch {

    func saveMovieSearch(with searchText: String, completion: ((Bool) -> Void)? = nil) {
        managedObjectContext.performChanges {
            _ = CDMovieSearch.insert(into: self.managedObjectContext,
                                     searchText: searchText)
            completion?(true)
        }
    }

    func findAll() -> [CDMovieSearch] {
        return CDMovieSearch.fetch(in: managedObjectContext)
    }

}
