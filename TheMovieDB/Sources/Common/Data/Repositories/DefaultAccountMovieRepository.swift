//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 22.01.2023.
//

import Combine
import Network
import Networking

public final class DefaultAccountTVShowsRepository {
  private let showsPageRemoteDataSource: AccountMovieRemoteDataSourceProtocol
  private let mapper: MoviePageMapperProtocol
  private let imageBasePath: String
  private let loggedUserRepository: LoggedUserRepositoryProtocol

  public init(showsPageRemoteDataSource: AccountMovieRemoteDataSourceProtocol,
              mapper: MoviePageMapperProtocol, imageBasePath: String,
              loggedUserRepository: LoggedUserRepositoryProtocol) {
    self.showsPageRemoteDataSource = showsPageRemoteDataSource
    self.mapper = mapper
    self.imageBasePath = imageBasePath
    self.loggedUserRepository = loggedUserRepository
  }
}

extension DefaultAccountTVShowsRepository: AccountMovieRepository {

  public func fetchFavoritesShows(page: Int) -> AnyPublisher<MoviePage, DataTransferError> {
    let loggedUser = loggedUserRepository.getUser()
    let userId = loggedUser?.id ?? 0

    return showsPageRemoteDataSource.fetchFavoritesShows(page: page, userId: userId, sessionId: loggedUser?.sessionId ?? "")
      .map { self.mapper.mapMoviePage($0, imageBasePath: self.imageBasePath, imageSize: .medium) }
      .eraseToAnyPublisher()
  }

  public func fetchWatchListShows(page: Int) -> AnyPublisher<MoviePage, DataTransferError> {
    let loggedUser = loggedUserRepository.getUser()
    let userId = loggedUser?.id ?? 0

    return showsPageRemoteDataSource.fetchWatchListShows(page: page, userId: userId, sessionId: loggedUser?.sessionId ?? "")
      .map { self.mapper.mapMoviePage($0, imageBasePath: self.imageBasePath, imageSize: .medium) }
      .eraseToAnyPublisher()
  }
}

