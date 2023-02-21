//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Foundation
import Combine
import Networking
import Network

final class DefaultGenreRemoteDataSource: GenreRemoteDataSource {

  private let dataTransferService: DataTransferServiceProtocol

  init(dataTransferService: DataTransferServiceProtocol) {
    self.dataTransferService = dataTransferService
  }

  func fetchGenres() -> AnyPublisher<GenreCollectionDTO, DataTransferError> {
    let endpoint = Endpoint<GenreCollectionDTO>(
      path: "3/genre/movie/list",
      method: .get
    )
    return dataTransferService.request(with: endpoint)
  }
}
