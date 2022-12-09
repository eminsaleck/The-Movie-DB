//
//  GenreRemoteDataSource.swift
//  NetworkInfrastructure
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

import Domain
import Data

final class GenreRemoteDataSource: GenreRemoteDataSourceProtocol {

    private let client: GenreClientProtocol

    init(client: GenreClientProtocol) {
        self.client = client
    }

    func getAllGenres(completion: @escaping (Result<[Domain.Genre], Error>) -> Void) {
        client.getAllGenres(completion: { result in
            switch result {
            case .success(let genreResult):
                let genres = genreResult.genres.map { $0.asDomain() }
                completion(.success(genres))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }

}
