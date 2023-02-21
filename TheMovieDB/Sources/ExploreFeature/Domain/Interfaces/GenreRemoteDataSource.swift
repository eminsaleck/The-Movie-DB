//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Combine
import Common
import Network

public protocol GenreRemoteDataSource {
    func fetchGenres() -> AnyPublisher<GenreCollectionDTO, DataTransferError>
    func fetchMoviesByGenre(genreId: Int) -> AnyPublisher<MoviePageDTO, DataTransferError>
}

