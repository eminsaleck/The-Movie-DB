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


  public func fetchPopularMovies(page: Int) -> AnyPublisher<MoviePageDTO, DataTransferError> {
    let endpoint = Endpoint<MoviePageDTO>(
      path: "3/movie/popular",
      method: .get,
      queryParameters: ["page": page]
    )
    return dataTransferService.request(with: endpoint).eraseToAnyPublisher()
  }

  public func fetchMoviesByGenre(genreId: Int, page: Int) -> AnyPublisher<MoviePageDTO, DataTransferError> {
    let endpoint = Endpoint<MoviePageDTO>(
      path: "3/discover/movie",
      method: .get,
      queryParameters: [
        "with_genres": genreId,
        "page": page,
        "sort_by": "popularity.desc",
      ]
    )
    return dataTransferService.request(with: endpoint).eraseToAnyPublisher()
  }

  public func searchMovieFor(query: String, page: Int) -> AnyPublisher<MoviePageDTO, DataTransferError> {
    let endpoint = Endpoint<MoviePageDTO>(
      path: "3/search/movie",
      method: .get,
      queryParameters: [
        "query": query,
        "page": page
      ]
    )
    return dataTransferService.request(with: endpoint).eraseToAnyPublisher()
  }
}
