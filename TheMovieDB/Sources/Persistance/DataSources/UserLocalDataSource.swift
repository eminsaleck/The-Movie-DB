//
//  UserLocalDataSource.swift
//  CoreDataInfrastructure
//
//  Created by LEMIN DAHOVICH on 08.12.2022.
//

import Domain
import Data

final class UserLocalDataSource: UserLocalDataSourceProtocol {

    private let store: PersistenceStore<CDUser>

    var didUpdateUser: (() -> Void)?

    // MARK: - Initializers

    init(store: PersistenceStore<CDUser>) {
        self.store = store
        self.store.configureResultsContoller(sortDescriptors: CDUser.defaultSortDescriptors,
                                             notifyChangesOn: [.insert])
        self.store.delegate = self
    }

    // MARK: - UserLocalDataSourceProtocol

    func find(with id: Int) -> User? {
        return store.find(with: id)?.asDomain()
    }

    func saveUser(_ user: User) {
        self.store.saveUser(user)
    }

}

// MARK: - PersistenceStoreDelegate

extension UserLocalDataSource: PersistenceStoreDelegate {

    func persistenceStore(willUpdateEntity shouldPrepare: Bool) {}

    func persistenceStore(didUpdateEntity update: Bool) {
        didUpdateUser?()
    }

}
