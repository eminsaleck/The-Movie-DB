//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Combine
import Common
import Network

final class DefaultFetchMoviesByGenreUseCase: FetchMoviesByGenreUseCase {
  private let moviePageRepository: MoviePageRepository

  init(moviePageRepository: MoviePageRepository) {
    self.moviePageRepository = moviePageRepository
  }

  func execute(requestValue: FetchMoviesByGenreUseCaseRequestValue) -> AnyPublisher<MoviePage, DataTransferError> {
      return moviePageRepository.fetchMoviesByGenre(genreId: requestValue.genreID, page: 1)
  }
}
