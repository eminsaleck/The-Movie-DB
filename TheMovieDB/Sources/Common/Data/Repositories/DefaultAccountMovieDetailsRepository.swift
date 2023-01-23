//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 23.01.2023.
//

import Combine
import Network

public final class DefaultAccountMovieDetailsRepository {
  private let showsRemoteDataSource: AccountMovieDetailsRemoteDataSourceProtocol
  private let mapper: AccountMovieDetailsMapperProtocol
  private let loggedUserRepository: LoggedUserRepositoryProtocol

  public init(showsRemoteDataSource: AccountMovieDetailsRemoteDataSourceProtocol,
              mapper: AccountMovieDetailsMapperProtocol,
              loggedUserRepository: LoggedUserRepositoryProtocol) {
    self.showsRemoteDataSource = showsRemoteDataSource
    self.mapper = mapper
    self.loggedUserRepository = loggedUserRepository
  }
}

extension DefaultAccountMovieDetailsRepository: AccountMovieDetailsRepository {

  public func markAsFavorite(tvShowId: Int, favorite: Bool) -> AnyPublisher<MovieActionStatus, DataTransferError> {
    let loggedUser = loggedUserRepository.getUser()
    let userId = loggedUser?.id ?? 0

    return showsRemoteDataSource.markAsFavorite(tvShowId: tvShowId, userId: String(userId), session: loggedUser?.sessionId ?? "", favorite: favorite)
      .map { self.mapper.mapActionResult(result: $0) }
      .eraseToAnyPublisher()
  }

    public func saveToWatchList(tvShowId: Int, watchedList: Bool) -> AnyPublisher<MovieActionStatus, DataTransferError> {
    let loggedUser = loggedUserRepository.getUser()
    let userId = loggedUser?.id ?? 0

    return showsRemoteDataSource.saveToWatchList(tvShowId: tvShowId, userId: String(userId), session: loggedUser?.sessionId ?? "", watchedList: watchedList)
      .map { self.mapper.mapActionResult(result: $0) }
      .eraseToAnyPublisher()
  }

  public func fetchTVShowStatus(tvShowId: Int) -> AnyPublisher<MovieAccountStatus, DataTransferError> {
    let sessionId = loggedUserRepository.getUser()?.sessionId ?? ""
    return showsRemoteDataSource.fetchTVShowStatus(tvShowId: tvShowId, sessionId: sessionId)
      .map { self.mapper.mapTVShowStatusResult(result: $0) }
      .eraseToAnyPublisher()
  }
}
