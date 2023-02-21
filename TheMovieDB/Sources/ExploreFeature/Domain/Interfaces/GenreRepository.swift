//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Combine
import Network

protocol GenresRepository {
  func genresCollection() -> AnyPublisher<GenreCollection, DataTransferError>
}
