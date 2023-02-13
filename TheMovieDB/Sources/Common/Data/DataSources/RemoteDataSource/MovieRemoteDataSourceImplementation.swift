//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 31.01.2023.
//

import Combine
import Network
import Networking

public final class MovieRemoteDataSourceImplementation: MovieRemoteDataSourceProtocol {
  private let dataTransferService: DataTransferServiceProtocol

  public init(dataTransferService: DataTransferServiceProtocol) {
    self.dataTransferService = dataTransferService
  }

  public func fetchAiringTodayShows(page: Int) -> AnyPublisher<MoviePageDTO, DataTransferError> {
    let endpoint = Endpoint<MoviePageDTO>(
      path: "3/tv/airing_today",
      method: .get,
      queryParameters: ["page": page]
    )
    return dataTransferService.request(with: endpoint).eraseToAnyPublisher()
  }

  public func fetchPopularMovies(page: Int) -> AnyPublisher<MoviePageDTO, DataTransferError> {
    let endpoint = Endpoint<MoviePageDTO>(
      path: "3/tv/popular",
      method: .get,
      queryParameters: ["page": page]
    )
    return dataTransferService.request(with: endpoint).eraseToAnyPublisher()
  }

  public func fetchMoviesByGenre(genreId: Int, page: Int) -> AnyPublisher<MoviePageDTO, DataTransferError> {
    let endpoint = Endpoint<MoviePageDTO>(
      path: "3/discover/tv",
      method: .get,
      queryParameters: [
        "with_genres": genreId,
        "page": page,
        "sort_by": "popularity.desc",
        "timezone": "America%2FNew_York",
        "include_null_first_air_dates": "false"
      ]
    )
    return dataTransferService.request(with: endpoint).eraseToAnyPublisher()
  }

  public func searchMovieFor(query: String, page: Int) -> AnyPublisher<MoviePageDTO, DataTransferError> {
    let endpoint = Endpoint<MoviePageDTO>(
      path: "3/search/tv",
      method: .get,
      queryParameters: [
        "query": query,
        "page": page
      ]
    )
    return dataTransferService.request(with: endpoint).eraseToAnyPublisher()
  }
}
