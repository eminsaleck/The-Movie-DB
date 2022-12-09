//
//  GenreClientProtocol.swift
//  NetworkInfrastructure
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

protocol GenreClientProtocol {

    func getAllGenres(completion: @escaping (Result<GenreResult, APIError>) -> Void)

}
