//
//  CoreDataStackProtocol.swift
//  CoreDataInfrastructure
//
//  Created by LEMIN DAHOVICH on 08.12.2022.
//

import CoreData

protocol CoreDataStackProtocol {

    var persistentContainer: NSPersistentContainer { get }

    func setExtensionPersistentStoreDescriptions(_ groupExtensionIds: [String])

}
