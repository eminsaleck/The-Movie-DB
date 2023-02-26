//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Combine
import Network

public protocol AccountMovieRepository {
  func fetchFavorites(page: Int) -> AnyPublisher<MoviePage, DataTransferError>
  func fetchWatchList(page: Int) -> AnyPublisher<MoviePage, DataTransferError>
}
