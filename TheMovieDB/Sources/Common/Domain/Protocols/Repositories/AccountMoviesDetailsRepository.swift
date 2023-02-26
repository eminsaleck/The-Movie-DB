//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Combine
import Network

public protocol AccountMovieDetailsRepository {
  func markAsFavorite(id: Int, favorite: Bool) -> AnyPublisher<MovieActionStatus, DataTransferError>

  func saveToWatchList(id: Int, watchedList: Bool) -> AnyPublisher<MovieActionStatus, DataTransferError>

  func fetchMovieStatus(id: Int) -> AnyPublisher<MovieAccountStatus, DataTransferError>
}
