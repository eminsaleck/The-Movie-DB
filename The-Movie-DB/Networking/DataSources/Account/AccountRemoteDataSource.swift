//
//  AccountRemoteDataSource.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Data
import UseCases

final class AccountRemoteDataSource: AccountRemoteDataSourceProtocol {
    
    private let client: AccountClientProtocol
    private let authManager: AuthenticationManagerProtocol

    init(client: AccountClientProtocol,
         authManager: AuthenticationManagerProtocol = AuthenticationManager.shared) {
        self.client = client
        self.authManager = authManager
    }
    
    func getFavoriteList(page: Int?, completion: @escaping (Result<[UseCases.Movie], Error>) -> Void) {
        guard let account = authManager.userAccount else { return }
        client.getFavoriteList(page: page ?? 1, sessionId: account.sessionId, accountId: account.accountId, completion: { result in
            switch result {
            case .success(let movieResult):
                guard let movieResult = movieResult else { return }
                let movies = movieResult.results.map { $0.asDomain() }
                completion(.success(movies))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    func getAccountDetail(completion: @escaping (Result<UseCases.User, Error>) -> Void) {
        guard let account = authManager.userAccount else { return }
        client.getAccountDetail(with: account.sessionId, completion: { result in
            switch result {
            case .success(let user):
                completion(.success(user.asDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    func markMovieAsFavorite(movieId: Int, favorite: Bool, completion: @escaping (Result<Bool, Error>) -> Void) {
        guard let account = authManager.userAccount else { return }
        client.markAsFavorite(movieId, sessionId: account.sessionId, accountId: account.accountId, favorite: favorite, completion: { result in
            switch result {
            case .success:
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    
    
}
