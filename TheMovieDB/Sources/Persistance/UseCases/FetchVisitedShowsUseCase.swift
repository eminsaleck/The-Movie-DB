//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//


import Combine
import Common

public protocol FetchVisitedShowsUseCase {
  func execute(requestValue: FetchVisitedShowsUseCaseRequestValue) -> AnyPublisher<[MovieVisited], ErrorEnvelope>
}

public struct FetchVisitedShowsUseCaseRequestValue {
  public init() { }
}

public final class FetchVisitedShowsUseCaseImplementation: FetchVisitedShowsUseCase {

  private let movieVisitedLocalRepository: MovieVisitedLocalRepositoryProtocol

  public init(movieVisitedLocalRepository: MovieVisitedLocalRepositoryProtocol) {
    self.movieVisitedLocalRepository = movieVisitedLocalRepository
  }

  public func execute(requestValue: FetchVisitedShowsUseCaseRequestValue) -> AnyPublisher<[MovieVisited], ErrorEnvelope> {
    return movieVisitedLocalRepository.fetchVisitedShows()
  }
}
