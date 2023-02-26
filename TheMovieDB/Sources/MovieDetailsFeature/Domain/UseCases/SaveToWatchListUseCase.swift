//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.02.2023.
//

import Foundation
import Combine
import Common
import Network

public protocol SaveToWatchListUseCase {
  func execute(requestValue: SaveToWatchListUseCaseRequestValue) -> AnyPublisher<Bool, DataTransferError>
}

public struct SaveToWatchListUseCaseRequestValue {
  let movieId: Int
  let watchList: Bool
}

final class DefaultSaveToWatchListUseCase: SaveToWatchListUseCase {
  private let accountMovieRepository: AccountMovieDetailsRepository

  init(accountMovieRepository: AccountMovieDetailsRepository) {
    self.accountMovieRepository = accountMovieRepository
  }

  public func execute(requestValue: SaveToWatchListUseCaseRequestValue) -> AnyPublisher<Bool, DataTransferError> {
    return accountMovieRepository.saveToWatchList(
        id: requestValue.movieId,
      watchedList: requestValue.watchList
    )
      .map { _ in requestValue.watchList }
      .eraseToAnyPublisher()
  }
}
