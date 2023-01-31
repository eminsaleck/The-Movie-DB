//
//  SearchTVShowsUseCase.swift
//  SearchShows
//
//  Created by Jeans Ruiz on 6/28/20.
//

import Combine
import Common
import Persistance
import Network
import Foundation

public protocol SearchMovieUseCase {
  func execute(requestValue: SearchMovieUseCaseRequestValue) -> AnyPublisher<MoviePage, DataTransferError>
}

public struct SearchMovieUseCaseRequestValue {
  public let query: String
  public let page: Int
}

final class SearchMovieUseCaseImplementation: SearchMovieUseCase {
  private let moviePageRepository: MoviePageRepository
  private let searchsLocalRepository: SearchLocalRepositoryProtocol

  public init(moviePageRepository: MoviePageRepository,
              searchsLocalRepository: SearchLocalRepositoryProtocol) {
    self.moviePageRepository = moviePageRepository
    self.searchsLocalRepository = searchsLocalRepository
  }

  func execute(requestValue: SearchMovieUseCaseRequestValue) -> AnyPublisher<MoviePage, DataTransferError> {
    return moviePageRepository.searchShowsFor(query: requestValue.query, page: requestValue.page)
      .receive(on: DispatchQueue.main)
      .flatMap { resultSearch -> AnyPublisher<MoviePage, DataTransferError> in
        if requestValue.page == 1 {
          return self.searchsLocalRepository.saveSearch(query: requestValue.query)
            .map { _ in resultSearch }
            .mapError { _ -> DataTransferError in DataTransferError.noResponse }
            .eraseToAnyPublisher()
        } else {
          return Just(resultSearch).setFailureType(to: DataTransferError.self).eraseToAnyPublisher()
        }
      }
      .eraseToAnyPublisher()
  }
}
