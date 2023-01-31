//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 31.01.2023.
//

import Foundation
import Network
import Combine

public final class MoviePageRepositoryImplementation {
  private let showsPageRemoteDataSource: MovieRemoteDataSourceProtocol
  private let mapper: MoviePageMapperProtocol
  private let imageBasePath: String

  public init(showsPageRemoteDataSource: MovieRemoteDataSourceProtocol, mapper: MoviePageMapperProtocol, imageBasePath: String) {
    self.showsPageRemoteDataSource = showsPageRemoteDataSource
    self.mapper = mapper
    self.imageBasePath = imageBasePath
  }
}

extension MoviePageRepositoryImplementation: MoviePageRepository {

  public func fetchAiringTodayShows(page: Int) -> AnyPublisher<MoviePage, DataTransferError> {
    return showsPageRemoteDataSource.fetchAiringTodayShows(page: page)
      .map { self.mapper.mapTVShowPage($0, imageBasePath: self.imageBasePath, imageSize: .medium) }
      .eraseToAnyPublisher()
  }

  public func fetchPopularShows(page: Int) -> AnyPublisher<MoviePage, DataTransferError> {
    return showsPageRemoteDataSource.fetchPopularShows(page: page)
      .map { self.mapper.mapTVShowPage($0, imageBasePath: self.imageBasePath, imageSize: .medium) }
      .eraseToAnyPublisher()
  }

  public func fetchShowsByGenre(genreId: Int, page: Int) -> AnyPublisher<MoviePage, DataTransferError> {
    return showsPageRemoteDataSource.fetchShowsByGenre(genreId: genreId, page: page)
      .map { self.mapper.mapTVShowPage($0, imageBasePath: self.imageBasePath, imageSize: .medium) }
      .eraseToAnyPublisher()
  }

  public func searchShowsFor(query: String, page: Int) -> AnyPublisher<MoviePage, DataTransferError> {
    return showsPageRemoteDataSource.searchShowsFor(query: query, page: page)
      .map { self.mapper.mapTVShowPage($0, imageBasePath: self.imageBasePath, imageSize: .medium) }
      .eraseToAnyPublisher()
  }
}
