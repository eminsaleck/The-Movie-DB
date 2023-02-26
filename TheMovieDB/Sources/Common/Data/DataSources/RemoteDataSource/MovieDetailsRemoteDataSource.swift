//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.02.2023.
//

import Combine
import Networking
import Network

public final class MovieDetailsRemoteDataSource: MovieDetailsRemoteDataSourceProtocol {
  private let dataTransferService: DataTransferServiceProtocol

  public init(dataTransferService: DataTransferServiceProtocol) {
    self.dataTransferService = dataTransferService
  }

  public func fetchMovieDetails(with id: Int) -> AnyPublisher<MovieDetailDTO, DataTransferError> {
    let endpoint = Endpoint<MovieDetailDTO>(
      path: "3/movie/\(id)",
      method: .get
    )
    return dataTransferService.request(with: endpoint).eraseToAnyPublisher()
  }
}
