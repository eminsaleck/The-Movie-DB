//
//  AccountClientProtocol.swift
//  NetworkInfrastructure
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

protocol AccountClientProtocol {

    func getFavoriteList(page: Int, sessionId: String, accountId: Int,
                         completion: @escaping (Result<MovieResult?, APIError>) -> Void)

    func getWatchlist(page: Int, sessionId: String, accountId: Int,
                      completion: @escaping (Result<MovieResult?, APIError>) -> Void)

    func getRecommendedList(page: Int,
                            accessToken: String, accountId: String,
                            completion: @escaping (Result<MovieResult?, APIError>) -> Void)

    func getCustomLists(page: Int,
                        accessToken: String, accountId: String,
                        completion: @escaping (Result<ListResult?, APIError>) -> Void)

    func getCustomListMovies(with accessToken: String, listId: String,
                             completion: @escaping (Result<MovieResult?, APIError>) -> Void)

    func getAccountDetail(with sessionId: String,
                          completion: @escaping (Result<User, APIError>) -> Void)

    func markAsFavorite(_ movieId: Int, sessionId: String,
                        accountId: Int, favorite: Bool,
                        completion: @escaping (Result<MarkAsFavoriteResult, APIError>) -> Void)

    func addToWatchlist(_ movieId: Int, sessionId: String,
                        accountId: Int, watchlist: Bool,
                        completion: @escaping (Result<AddToWatchlistResult, APIError>) -> Void)

}
