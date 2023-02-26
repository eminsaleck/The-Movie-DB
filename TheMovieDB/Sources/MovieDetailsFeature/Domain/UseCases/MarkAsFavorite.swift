//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 25.02.2023.
//

import Combine
import Common
import Network

public protocol MarkAsFavoriteUseCase {
  func execute(requestValue: MarkAsFavoriteUseCaseRequestValue) -> AnyPublisher<Bool, DataTransferError>
}

public struct MarkAsFavoriteUseCaseRequestValue {
  let movieId: Int
  let favorite: Bool
}

public final class DefaultMarkAsFavoriteUseCase: MarkAsFavoriteUseCase {
  private let accountMovieRepository: AccountMovieDetailsRepository

  public init(accountMovieRepository: AccountMovieDetailsRepository) {
    self.accountMovieRepository = accountMovieRepository
  }

  public func execute(requestValue: MarkAsFavoriteUseCaseRequestValue) -> AnyPublisher<Bool, DataTransferError> {
    return accountMovieRepository.markAsFavorite(
        id: requestValue.movieId,
      favorite: requestValue.favorite
    )
      .map { _ in requestValue.favorite }
      .eraseToAnyPublisher()
  }
}
