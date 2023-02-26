//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 23.01.2023.
//

import Combine
import Network

public final class AccountMovieDetailsRepositoryImplementation {
  private let movieRemoteDataSource: AccountMovieDetailsRemoteDataSourceProtocol
  private let mapper: AccountMovieDetailsMapperProtocol
  private let loggedUserRepository: LoggedUserRepositoryProtocol

  public init(movieRemoteDataSource: AccountMovieDetailsRemoteDataSourceProtocol,
              mapper: AccountMovieDetailsMapperProtocol,
              loggedUserRepository: LoggedUserRepositoryProtocol) {
    self.movieRemoteDataSource = movieRemoteDataSource
    self.mapper = mapper
    self.loggedUserRepository = loggedUserRepository
  }
}

extension AccountMovieDetailsRepositoryImplementation: AccountMovieDetailsRepository {

  public func markAsFavorite(id: Int, favorite: Bool) -> AnyPublisher<MovieActionStatus, DataTransferError> {
    let loggedUser = loggedUserRepository.getUser()
    let userId = loggedUser?.id ?? 0

    return movieRemoteDataSource.markAsFavorite(movieID: id, userId: String(userId), session: loggedUser?.sessionId ?? "", favorite: favorite)
      .map { self.mapper.mapActionResult(result: $0) }
      .eraseToAnyPublisher()
  }

    public func saveToWatchList(id: Int, watchedList: Bool) -> AnyPublisher<MovieActionStatus, DataTransferError> {
    let loggedUser = loggedUserRepository.getUser()
    let userId = loggedUser?.id ?? 0

    return movieRemoteDataSource.saveToWatchList(movieID: id, userId: String(userId), session: loggedUser?.sessionId ?? "", watchedList: watchedList)
      .map { self.mapper.mapActionResult(result: $0) }
      .eraseToAnyPublisher()
  }

  public func fetchMovieStatus(id: Int) -> AnyPublisher<MovieAccountStatus, DataTransferError> {
    let sessionId = loggedUserRepository.getUser()?.sessionId ?? ""
    return movieRemoteDataSource.fetchMovieStatus(movieID: id, sessionId: sessionId)
      .map { self.mapper.mapMovieStatusResult(result: $0) }
      .eraseToAnyPublisher()
  }
}
