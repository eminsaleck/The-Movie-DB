//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//


import Combine

public protocol RecentVisitedShowDidChangeUseCase {
  func execute() -> AnyPublisher<Bool, Never>
}

public final class RecentVisitedShowDidChangeUseCaseImplementation: RecentVisitedShowDidChangeUseCase {
  private let movieVisitedLocalRepository: MovieVisitedLocalRepositoryProtocol

  public init(movieVisitedLocalRepository: MovieVisitedLocalRepositoryProtocol) {
    self.movieVisitedLocalRepository = movieVisitedLocalRepository
  }

  public func execute() -> AnyPublisher<Bool, Never> {
    return movieVisitedLocalRepository.recentVisitedShowsDidChange()
  }
}
