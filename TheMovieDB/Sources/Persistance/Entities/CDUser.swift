//
//  CDUser.swift
//  CoreDataInfrastructure
//
//  Created by LEMIN DAHOVICH on 08.12.2022.
//

import CoreData
import Domain

final class CDUser: NSManagedObject {

    @NSManaged private(set) var id: Int
    @NSManaged private(set) var name: String
    @NSManaged private(set) var username: String
    @NSManaged private(set) var includeAdult: Bool

    static func insert(into context: NSManagedObjectContext,
                       id: Int,
                       name: String,
                       username: String,
                       includeAdult: Bool) -> CDUser {
        let user: CDUser = context.insertObject()
        user.id = id
        user.name = name
        user.username = username
        user.includeAdult = includeAdult
        return user
    }

}

// MARK: - DomainConvertible

extension CDUser: DomainConvertible {

    func asDomain() -> User {
        return User(id: id, name: name, username: username, includeAdult: includeAdult)
    }

}

// MARK: - Managed

extension CDUser: Managed { }
