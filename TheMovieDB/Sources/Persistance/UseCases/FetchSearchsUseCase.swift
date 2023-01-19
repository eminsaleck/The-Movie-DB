//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//


import Combine
import Shared

public protocol FetchSearchesUseCase {
  func execute(requestValue: FetchSearchesUseCaseRequestValue) -> AnyPublisher<[Search], ErrorEnvelope>
}

public struct FetchSearchesUseCaseRequestValue {
  public init() { }
}

public final class DefaultFetchSearchesUseCase: FetchSearchesUseCase {
  private let searchLocalRepository: SearchLocalRepositoryProtocol

  public init(searchLocalRepository: SearchLocalRepositoryProtocol) {
    self.searchLocalRepository = searchLocalRepository
  }

  public func execute(requestValue: FetchSearchesUseCaseRequestValue) -> AnyPublisher<[Search], ErrorEnvelope> {
    return searchLocalRepository.fetchRecentSearches()
  }
}
