//
//  AuthRemoteDataSourceProtocol.swift
//  UpcomingMoviesData
//  Data
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Foundation
import Domain

public protocol AuthRemoteDataSourceProtocol {

    func getAuthURL(completion: @escaping (Result<URL, Error>) -> Void)
    func signInUser(completion: @escaping (Result<User, Error>) -> Void)
    func signOutUser(completion: @escaping (Result<Bool, Error>) -> Void)
    func currentUserId() -> Int?

}
