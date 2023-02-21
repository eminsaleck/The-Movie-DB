//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 23.01.2023.
//

import Combine
import Network

public protocol AccountMovieDetailsRemoteDataSourceProtocol {
  func markAsFavorite(tvShowId: Int, userId: String,session: String,  favorite: Bool) -> AnyPublisher<MovieActionStatusDTO, DataTransferError>

  func saveToWatchList(tvShowId: Int, userId: String, session: String, watchedList: Bool) -> AnyPublisher<MovieActionStatusDTO, DataTransferError>

  func fetchMovieStatus(tvShowId: Int, sessionId: String) -> AnyPublisher<MovieAccountStatusDTO, DataTransferError>
}

