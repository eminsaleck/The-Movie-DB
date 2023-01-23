//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Combine
import Network

public protocol AccountMovieDetailsRepository {
  func markAsFavorite(tvShowId: Int, favorite: Bool) -> AnyPublisher<MovieActionStatus, DataTransferError>

  func saveToWatchList(tvShowId: Int, watchedList: Bool) -> AnyPublisher<MovieActionStatus, DataTransferError>

  func fetchTVShowStatus(tvShowId: Int) -> AnyPublisher<MovieAccountStatus, DataTransferError>
}
