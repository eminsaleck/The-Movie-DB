//
//  AuthRepository.swift
//  UpcomingMoviesData
//
//  Created by LEMIN DAHOVICH on 09.12.2022.
//

import Foundation
import Domain

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
