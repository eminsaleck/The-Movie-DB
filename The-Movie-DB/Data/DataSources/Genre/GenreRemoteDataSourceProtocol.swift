//
//  GenreRemoteDataSourceProtocol.swift
//  Data
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Domain

public protocol GenreRemoteDataSourceProtocol {

    func getAllGenres(completion: @escaping (Result<[Genre], Error>) -> Void)

}
