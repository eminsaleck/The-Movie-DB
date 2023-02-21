//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Combine
import Network
import Common

protocol GenresRepository {
    func genresCollection() -> AnyPublisher<GenreCollection, DataTransferError>
    func moviesByGenre(genreId: Int) -> AnyPublisher<[MoviePage.Movie], DataTransferError> 
}
