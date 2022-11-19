//
//  AccountUseCaseProtocol.swift
//  UseCases
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

public protocol AccountUseCaseProtocol {

    func getFavoriteList(page: Int?, completion: @escaping (Result<[Movie], Error>) -> Void)

    func getAccountDetail(completion: @escaping (Result<User, Error>) -> Void)

    func markMovieAsFavorite(movieId: Int,
                             favorite: Bool,
                             completion: @escaping (Result<Bool, Error>) -> Void)
}
