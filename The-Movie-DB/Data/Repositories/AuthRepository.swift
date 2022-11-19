//
//  AuthRepository.swift
//  Data
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Foundation
import UseCases

final class AuthRepository: AuthUseCaseProtocol {

    private var remoteDataSource: AuthRemoteDataSourceProtocol

    init(remoteDataSource: AuthRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }

    func getAuthURL(completion: @escaping (Result<URL, Error>) -> Void) {
        remoteDataSource.getAuthURL(completion: completion)
    }

    func signInUser(completion: @escaping (Result<User, Error>) -> Void) {
        remoteDataSource.signInUser(completion: completion)
    }

    func signOutUser(completion: @escaping (Result<Bool, Error>) -> Void) {
        remoteDataSource.signOutUser(completion: completion)
    }

    func currentUserId() -> Int? {
        return remoteDataSource.currentUserId()
    }

}

