//
//  UserRepository.swift
//  Data
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import UseCases


public final class UserRepository: UserUseCaseProtocol {

    private var localDataSource: UserLocalDataSourceProtocol

    public var didUpdateUser: (() -> Void)? {
        didSet {
            self.localDataSource.didUpdateUser = didUpdateUser
        }
    }

    init(localDataSource: UserLocalDataSourceProtocol) {
        self.localDataSource = localDataSource
    }

    public func find(with id: Int) -> User? {
        return localDataSource.find(with: id)
    }

    public func saveUser(_ user: User) {
        localDataSource.saveUser(user)
    }

}

