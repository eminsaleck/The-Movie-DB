//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Combine
import Network
import Networking
import Common

final class DefaultGenreRepository {
  private let remoteDataSource: GenreRemoteDataSource

  init(remoteDataSource: GenreRemoteDataSource) {
    self.remoteDataSource = remoteDataSource
  }
}

extension DefaultGenreRepository: GenresRepository {

  func genresCollection() -> AnyPublisher<GenreCollection, DataTransferError> {
    return remoteDataSource.fetchGenres()
      .map { collection in
        let genresDomain = collection.genres.map { Genre(id: $0.id, name: $0.name) }
        return GenreCollection(genres: genresDomain )
      }
      .eraseToAnyPublisher()
  }
}
