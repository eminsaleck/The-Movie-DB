//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 22.01.2023.
//

import Combine
import Network
import Networking

public final class DefaultAccountMovieRepository {
  private let moviePageRemoteDataSource: AccountMovieRemoteDataSourceProtocol
  private let mapper: MoviePageMapperProtocol
  private let imageBasePath: String
  private let loggedUserRepository: LoggedUserRepositoryProtocol

  public init(moviePageRemoteDataSource: AccountMovieRemoteDataSourceProtocol,
              mapper: MoviePageMapperProtocol, imageBasePath: String,
              loggedUserRepository: LoggedUserRepositoryProtocol) {
    self.moviePageRemoteDataSource = moviePageRemoteDataSource
    self.mapper = mapper
    self.imageBasePath = imageBasePath
    self.loggedUserRepository = loggedUserRepository
  }
}

extension DefaultAccountMovieRepository: AccountMovieRepository {

  public func fetchFavorites(page: Int) -> AnyPublisher<MoviePage, DataTransferError> {
    let loggedUser = loggedUserRepository.getUser()
    let userId = loggedUser?.id ?? 0

    return moviePageRemoteDataSource.fetchFavoritesMovies(page: page, userId: userId, sessionId: loggedUser?.sessionId ?? "")
      .map { self.mapper.mapMoviePage($0, imageBasePath: self.imageBasePath, imageSize: .medium) }
      .eraseToAnyPublisher()
  }

  public func fetchWatchList(page: Int) -> AnyPublisher<MoviePage, DataTransferError> {
    let loggedUser = loggedUserRepository.getUser()
    let userId = loggedUser?.id ?? 0

    return moviePageRemoteDataSource.fetchFavoritesMovies(page: page, userId: userId, sessionId: loggedUser?.sessionId ?? "")
      .map { self.mapper.mapMoviePage($0, imageBasePath: self.imageBasePath, imageSize: .medium) }
      .eraseToAnyPublisher()
  }
}

