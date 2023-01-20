//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Combine
import Network

public protocol AccountTVShowsRepository {
  func fetchFavoritesShows(page: Int) -> AnyPublisher<MoviePage, DataTransferError>
  func fetchWatchListShows(page: Int) -> AnyPublisher<MoviePage, DataTransferError>
}
