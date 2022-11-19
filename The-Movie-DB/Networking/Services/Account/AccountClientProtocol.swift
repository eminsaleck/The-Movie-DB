//
//  AccountProtocol.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Foundation

protocol AccountClientProtocol {
    
    func getFavoriteList(page: Int, sessionId: String, accountId: Int,
                         completion: @escaping (Result<MovieResult?, APIError>) -> Void)
    
    func getAccountDetail(with sessionId: String,
                          completion: @escaping (Result<User, APIError>) -> Void)

    func markAsFavorite(_ movieId: Int, sessionId: String,
                        accountId: Int, favorite: Bool,
                        completion: @escaping (Result<MarkAsFavouriteResult, APIError>) -> Void)
}
