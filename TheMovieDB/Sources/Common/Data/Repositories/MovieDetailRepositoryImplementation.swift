//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.02.2023.
//

import Foundation

public final class DefaultTVShowsDetailRepository {
  private let showsPageRemoteDataSource: TVShowsDetailsRemoteDataSourceProtocol
  private let mapper: TVShowDetailsMapperProtocol
  private let imageBasePath: String

  public init(showsPageRemoteDataSource: TVShowsDetailsRemoteDataSourceProtocol, mapper: TVShowDetailsMapperProtocol, imageBasePath: String) {
    self.showsPageRemoteDataSource = showsPageRemoteDataSource
    self.mapper = mapper
    self.imageBasePath = imageBasePath
  }
}

extension DefaultTVShowsDetailRepository: TVShowsDetailsRepository {
  public func fetchTVShowDetails(with showId: Int) -> AnyPublisher<TVShowDetail, DataTransferError> {
    return showsPageRemoteDataSource.fetchTVShowDetails(with: showId)
      .map { self.mapper.mapTVShow($0, imageBasePath: self.imageBasePath, imageSize: .medium) }
      .eraseToAnyPublisher()
  }
}
