//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Foundation
import Combine
import Common
import Networking
import Network

final class DefaultGenreRemoteDataSource: GenreRemoteDataSource {
    
    private let dataTransferService: DataTransferServiceProtocol
    
    init(dataTransferService: DataTransferServiceProtocol) {
        self.dataTransferService = dataTransferService
    }
    
    func fetchGenres() -> AnyPublisher<GenreCollectionDTO, DataTransferError> {
        let endpoint = Endpoint<GenreCollectionDTO>(
            path: "3/genre/movie/list",
            method: .get
        )
        return dataTransferService.request(with: endpoint)
    }
    
    func fetchMoviesByGenre(genreId: Int) -> AnyPublisher<MoviePageDTO, DataTransferError> {
        let endpoint = Endpoint<MoviePageDTO>(
            path: "3/discover/movie",
            method: .get,
            queryParameters: [
                "with_genres": genreId,
                "sort_by": "popularity.desc",
            ]
        )
        return dataTransferService.request(with: endpoint).eraseToAnyPublisher()
    }
    
}
