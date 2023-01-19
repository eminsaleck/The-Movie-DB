//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Combine
import Network

public protocol AccountMoviesDetailsRepository {
  func markAsFavorite(tvShowId: Int, favorite: Bool) -> AnyPublisher<TVShowActionStatus, DataTransferError>

  func saveToWatchList(tvShowId: Int, watchedList: Bool) -> AnyPublisher<TVShowActionStatus, DataTransferError>

  func fetchTVShowStatus(tvShowId: Int) -> AnyPublisher<TVShowAccountStatus, DataTransferError>
}
