//
//  AccountRepository.swift
//  Data
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import UseCases

final class AccountRepository: AccountUseCaseProtocol {

    private var remoteDataSource: AccountRemoteDataSourceProtocol

    init(remoteDataSource: AccountRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    

    func getFavoriteList(page: Int?, completion: @escaping (Result<[Movie], Error>) -> Void) {
        remoteDataSource.getFavoriteList(page: page, completion: completion)
    }

    func getAccountDetail(completion: @escaping (Result<User, Error>) -> Void) {
        remoteDataSource.getAccountDetail(completion: completion)
    }

    func markMovieAsFavorite(movieId: Int, favorite: Bool, completion: @escaping (Result<Bool, Error>) -> Void) {
        remoteDataSource.markMovieAsFavorite(movieId: movieId, favorite: favorite, completion: completion)
    }


}
