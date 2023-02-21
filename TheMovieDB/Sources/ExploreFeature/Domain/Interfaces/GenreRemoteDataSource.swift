//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Combine
import Network

public protocol GenreRemoteDataSource {
    func fetchGenres() -> AnyPublisher<GenreCollectionDTO, DataTransferError>
}

