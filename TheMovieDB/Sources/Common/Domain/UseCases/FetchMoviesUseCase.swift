//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Combine
import Network

public protocol FetchMoviesUseCase {
  func execute(requestValue: FetchMoviesUseCaseRequestValue) -> AnyPublisher<MoviePage, DataTransferError>
}
public protocol FetchMoviesByGenreUseCase {
  func execute(requestValue: FetchMoviesByGenreUseCaseRequestValue) -> AnyPublisher<MoviePage, DataTransferError>
}

public struct FetchMoviesUseCaseRequestValue {
  public let page: Int

  public init(page: Int) {
    self.page = page
  }
}

public struct FetchMoviesByGenreUseCaseRequestValue {
  public let genreID: Int

  public init(genreID: Int) {
    self.genreID = genreID
  }
}
