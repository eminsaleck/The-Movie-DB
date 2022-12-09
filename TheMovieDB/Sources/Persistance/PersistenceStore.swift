//
//  FavoriteStore.swift
//  CoreDataInfrastructure
//
//  Created by LEMIN DAHOVICH on 08.12.2022.
//

import CoreData

protocol PersistenceStoreDelegate: AnyObject {

    func persistenceStore(willUpdateEntity shouldPrepare: Bool)
    func persistenceStore(didUpdateEntity update: Bool)

}

class PersistenceStore<Entity: NSManagedObject>: NSObject, NSFetchedResultsControllerDelegate {

    private let persistentContainer: NSPersistentContainer

    private var fetchedResultsController: NSFetchedResultsController<Entity>!
    private var changeTypes: [NSFetchedResultsChangeType]!

    weak var delegate: PersistenceStoreDelegate?

    var managedObjectContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func createBackgroundContext() -> NSManagedObjectContext {
        return persistentContainer.newBackgroundContext()
    }

    // MARK: - Initializers

    init(_ persistentContainer: NSPersistentContainer) {
        self.persistentContainer = persistentContainer
        super.init()
    }

    // MARK: - Internal

    func configureResultsContoller(batchSize: Int = 5, limit: Int = 0,
                                   sortDescriptors: [NSSortDescriptor] = [],
                                   predicate: NSPredicate? = nil,
                                   notifyChangesOn changeTypes: [NSFetchedResultsChangeType] = [.insert, .delete, .move, .update]) {
        guard let entityName = Entity.entity().name else { fatalError() }

        let request =  NSFetchRequest<Entity>(entityName: entityName)
        request.fetchBatchSize = batchSize
        request.fetchLimit = limit
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        request.returnsObjectsAsFaults = false

        self.changeTypes = changeTypes

        fetchedResultsController = NSFetchedResultsController(fetchRequest: request,
                                                              managedObjectContext: managedObjectContext,
                                                              sectionNameKeyPath: nil,
                                                              cacheName: nil)
        fetchedResultsController.delegate = self

        performFetch()
    }

    func performFetch() {
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    // MARK: - NSFetchedResultsControllerDelegate

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        delegate?.persistenceStore(willUpdateEntity: true)
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange anObject: Any,
                    at indexPath: IndexPath?,
                    for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        guard changeTypes.contains(type) else { return }

        if anObject as? Entity != nil {
            delegate?.persistenceStore(didUpdateEntity: true)
        }
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        delegate?.persistenceStore(willUpdateEntity: false)
    }

}
