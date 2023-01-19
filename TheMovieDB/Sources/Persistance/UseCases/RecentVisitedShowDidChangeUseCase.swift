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

public final class DefaultRecentVisitedShowDidChangeUseCase: RecentVisitedShowDidChangeUseCase {
  private let showsVisitedLocalRepository: ShowsVisitedLocalRepositoryProtocol

  public init(showsVisitedLocalRepository: ShowsVisitedLocalRepositoryProtocol) {
    self.showsVisitedLocalRepository = showsVisitedLocalRepository
  }

  public func execute() -> AnyPublisher<Bool, Never> {
    return showsVisitedLocalRepository.recentVisitedShowsDidChange()
  }
}
