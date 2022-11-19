//
//  AccountRemoteDataSourceProtocol.swift
//  Data
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import UseCases

public protocol AccountRemoteDataSourceProtocol {

    func getFavoriteList(page: Int?, completion: @escaping (Result<[Movie], Error>) -> Void)

    func getAccountDetail(completion: @escaping (Result<User, Error>) -> Void)

    func markMovieAsFavorite(movieId: Int,
                             favorite: Bool,
                             completion: @escaping (Result<Bool, Error>) -> Void)

}
