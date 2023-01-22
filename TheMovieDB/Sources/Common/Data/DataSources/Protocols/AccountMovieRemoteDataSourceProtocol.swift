//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 22.01.2023.
//

import Combine
import Network

public protocol AccountMovieRemoteDataSourceProtocol {
  func fetchFavoritesShows(page: Int, userId: Int, sessionId: String) -> AnyPublisher<MoviePageDTO, DataTransferError>
  func fetchWatchListShows(page: Int, userId: Int, sessionId: String) -> AnyPublisher<MoviePageDTO, DataTransferError>
}
