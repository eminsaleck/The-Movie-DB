//
//  UserRepository.swift
//  UpcomingMoviesData
//
//  Created by LEMIN DAHOVICH on 09.12.2022.
//

import Domain

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
