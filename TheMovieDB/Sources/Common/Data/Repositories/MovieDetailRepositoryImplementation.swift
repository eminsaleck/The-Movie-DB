//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.02.2023.
//

import Combine
import Network

public final class MovieDetailRepositoryImplementation {
  private let moviePageRemoteDataSource: MovieDetailsRemoteDataSourceProtocol
  private let mapper: MovieDetailsMapperProtocol
  private let imageBasePath: String

  public init(moviePageRemoteDataSource: MovieDetailsRemoteDataSourceProtocol, mapper: MovieDetailsMapperProtocol, imageBasePath: String) {
    self.moviePageRemoteDataSource = moviePageRemoteDataSource
    self.mapper = mapper
    self.imageBasePath = imageBasePath
  }
}

extension MovieDetailRepositoryImplementation: MovieDetailsRepository {
  public func fetchMovieDetails(with id: Int) -> AnyPublisher<MovieDetail, DataTransferError> {
    return moviePageRemoteDataSource.fetchMovieDetails(with: id)
      .map { self.mapper.mapMovie($0, imageBasePath: self.imageBasePath, imageSize: .medium) }
      .eraseToAnyPublisher()
  }
}
