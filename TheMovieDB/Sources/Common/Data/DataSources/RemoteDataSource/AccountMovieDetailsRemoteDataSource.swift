//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 23.01.2023.
//

import Combine
import Networking
import Network

public class AccountMovieDetailsRemoteDataSource {
  private let dataTransferService: DataTransferServiceProtocol

  public init(dataTransferService: DataTransferServiceProtocol) {
    self.dataTransferService = dataTransferService
  }
}

extension AccountMovieDetailsRemoteDataSource: AccountMovieDetailsRemoteDataSourceProtocol {
  public func markAsFavorite(tvShowId: Int, userId: String, session: String, favorite: Bool) -> AnyPublisher<MovieActionStatusDTO, DataTransferError> {
    let endpoint = Endpoint<MovieActionStatusDTO>(
      path: "3/account/\(userId)/favorite",
      method: .post,
      queryParameters: [
        "session_id": session
      ],
      bodyParameters: [
        "media_type": "tv",
        "media_id": tvShowId,
        "favorite": favorite
      ]
    )
    return dataTransferService.request(with: endpoint).eraseToAnyPublisher()
  }

  public func saveToWatchList(tvShowId: Int, userId: String, session: String, watchedList: Bool) -> AnyPublisher<MovieActionStatusDTO, DataTransferError> {
    let endpoint = Endpoint<MovieActionStatusDTO>(
      path: "3/account/\(userId)/watchlist",
      method: .post,
      queryParameters: [
        "session_id": session
      ],
      bodyParameters: [
        "media_type": "tv",
        "media_id": tvShowId,
        "watchlist": watchedList
      ]
    )
    return dataTransferService.request(with: endpoint).eraseToAnyPublisher()
  }

  public func fetchMovieStatus(tvShowId: Int, sessionId: String) -> AnyPublisher<MovieAccountStatusDTO, DataTransferError> {
    let endpoint = Endpoint<MovieAccountStatusDTO>(
      path: "3/tv/\(String(tvShowId))/account_states",
      method: .get,
      queryParameters: [
        "session_id": sessionId
      ]
    )
    return dataTransferService.request(with: endpoint).eraseToAnyPublisher()
  }
}
