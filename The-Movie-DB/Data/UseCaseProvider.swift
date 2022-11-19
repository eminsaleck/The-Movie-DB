 //
//  UseCaseProvider.swift
//  Data
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import UseCases

public class UseCaseProvider: UseCaseProviderProtocol {

    private let localDataSource: LocalDataSourceProtocol
    private let remoteDataSource: RemoteDataSourceProtocol

    public init(localDataSource: LocalDataSourceProtocol,
                remoteDataSource: RemoteDataSourceProtocol) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }

    public func userUseCase() -> UserUseCaseProtocol {
        let localDataSource = self.localDataSource.userDataSource()
        return UserRepository(localDataSource: localDataSource)
    }

    public func accountUseCase() -> AccountUseCaseProtocol {
        let remoteDataSource = self.remoteDataSource.accountDataSource()
        return AccountRepository(remoteDataSource: remoteDataSource)
    }

    public func authUseCase() -> AuthUseCaseProtocol {
        let remoteDataSource = self.remoteDataSource.authDataSource()
        return AuthRepository(remoteDataSource: remoteDataSource)
    }

}
