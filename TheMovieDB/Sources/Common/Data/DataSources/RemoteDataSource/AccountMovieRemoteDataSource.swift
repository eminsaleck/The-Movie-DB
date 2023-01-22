//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 22.01.2023.
//

import Combine
import Networking
import Network

public class AccountMovieRemoteDataSource {
  private let dataTransferService: DataTransferServiceProtocol

  public init(dataTransferService: DataTransferServiceProtocol) {
    self.dataTransferService = dataTransferService
  }
}

extension AccountMovieRemoteDataSource: AccountMovieRemoteDataSourceProtocol {
  public func fetchFavoritesShows(page: Int, userId: Int, sessionId: String) -> AnyPublisher<MoviePageDTO, DataTransferError> {
    let endpoint = Endpoint<MoviePageDTO>(
      path: "3/account/\(userId)/favorite/tv",
      method: .get,
      queryParameters: [
        "page": page,
        "session_id": sessionId
      ]
    )
    return dataTransferService.request(with: endpoint).eraseToAnyPublisher()
  }

  public func fetchWatchListShows(page: Int, userId: Int, sessionId: String) -> AnyPublisher<MoviePageDTO, DataTransferError> {
    let endpoint = Endpoint<MoviePageDTO>(
      path: "3/account/\(userId)/watchlist/tv",
      method: .get,
      queryParameters: [
        "page": page,
        "session_id": sessionId
      ]
    )
    return dataTransferService.request(with: endpoint).eraseToAnyPublisher()
  }
}
