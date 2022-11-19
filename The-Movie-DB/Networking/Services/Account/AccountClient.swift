//
//  AccountClient.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Foundation

class AccountClient: APICaller, AccountClientProtocol {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        let configuration: URLSessionConfiguration = .default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        self.init(configuration: configuration)
    }
}

extension AccountClient{
    
    func getFavoriteList(page: Int, sessionId: String, accountId: Int,
                         completion: @escaping (Result<MovieResult?, APIError>) -> Void) {
        let request = AccountProvider.getFavoriteList(page: page,
                                                      sessionId: sessionId,
                                                      accountId: accountId).request
        fetch(with: request, decode: { json -> MovieResult? in
            guard let movieResult = json as? MovieResult else { return  nil }
            return movieResult
        }, completion: completion)
    }
    
    func getAccountDetail(with sessionId: String, completion: @escaping (Result<User, APIError>) -> Void) {
        fetch(with: AccountProvider.getAccountDetail(sessionId: sessionId).request, decode: { json -> User? in
            guard let user = json as? User else { return  nil }
            return user
        }, completion: completion)
    }
    
    func markAsFavorite(_ movieId: Int, sessionId: String,
                        accountId: Int, favorite: Bool,
                        completion: @escaping (Result<MarkAsFavouriteResult, APIError>) -> Void) {
        fetch(with: AccountProvider.markAsFavorite(sessionId: sessionId, accountId: accountId,
                                                   movieId: movieId, favorite: favorite).request,
              decode: { json -> MarkAsFavouriteResult? in
            guard let result = json as? MarkAsFavouriteResult else { return  nil }
            return result
        }, completion: completion)
    }
}
