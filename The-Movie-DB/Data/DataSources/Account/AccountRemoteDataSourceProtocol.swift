//
//  AccountRemoteDataSourceProtocol.swift
//  UpcomingMoviesData
//  Data
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Domain

public protocol AccountRemoteDataSourceProtocol {

    func getFavoriteList(page: Int?, completion: @escaping (Result<[Movie], Error>) -> Void)

    func getWatchlist(page: Int?, completion: @escaping (Result<[Movie], Error>) -> Void)

    func getRecommendedList(page: Int?, completion: @escaping (Result<[Movie], Error>) -> Void)

    func getCustomLists(page: Int?, completion: @escaping (Result<[List], Error>) -> Void)

    func getCustomListMovies(listId: String,
                             completion: @escaping (Result<[Movie], Error>) -> Void)

    func getAccountDetail(completion: @escaping (Result<User, Error>) -> Void)

    func markMovieAsFavorite(movieId: Int,
                             favorite: Bool,
                             completion: @escaping (Result<Bool, Error>) -> Void)

    func addToWatchlist(movieId: Int,
                        watchlist: Bool,
                        completion: @escaping (Result<Bool, Error>) -> Void)

}
