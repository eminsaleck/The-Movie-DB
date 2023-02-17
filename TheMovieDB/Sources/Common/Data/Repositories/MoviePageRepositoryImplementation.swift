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
  private let moviePageRemoteDataSource: MovieRemoteDataSourceProtocol
  private let mapper: MoviePageMapperProtocol
  private let imageBasePath: String

  public init(moviePageRemoteDataSource: MovieRemoteDataSourceProtocol, mapper: MoviePageMapperProtocol, imageBasePath: String) {
    self.moviePageRemoteDataSource = moviePageRemoteDataSource
    self.mapper = mapper
    self.imageBasePath = imageBasePath
  }
}

extension MoviePageRepositoryImplementation: MoviePageRepository {

  public func fetchPopularMovies(page: Int) -> AnyPublisher<MoviePage, DataTransferError> {
    return moviePageRemoteDataSource.fetchPopularMovies(page: page)
      .map {
          self.mapper.mapMoviePage($0, imageBasePath: self.imageBasePath, imageSize: .medium)
      }
      .eraseToAnyPublisher()
  }

  public func fetchMoviesByGenre(genreId: Int, page: Int) -> AnyPublisher<MoviePage, DataTransferError> {
    return moviePageRemoteDataSource.fetchMoviesByGenre(genreId: genreId, page: page)
      .map { self.mapper.mapMoviePage($0, imageBasePath: self.imageBasePath, imageSize: .medium) }
      .eraseToAnyPublisher()
  }

  public func searchMovieFor(query: String, page: Int) -> AnyPublisher<MoviePage, DataTransferError> {
    return moviePageRemoteDataSource.searchMovieFor(query: query, page: page)
      .map { self.mapper.mapMoviePage($0, imageBasePath: self.imageBasePath, imageSize: .medium) }
      .eraseToAnyPublisher()
  }
}
