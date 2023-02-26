//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 25.02.2023.
//

import Combine
import Common
import Network

protocol FetchAccountStates {
  func execute(requestValue: FetchAccountStatesRequestValue) -> AnyPublisher<MovieAccountStatus, DataTransferError>
}

struct FetchAccountStatesRequestValue {
  let id: Int
}

final class DefaultFetchAccountStates: FetchAccountStates {
  private let accountMovieRepository: AccountMovieDetailsRepository

  init(accountMovieRepository: AccountMovieDetailsRepository) {
    self.accountMovieRepository = accountMovieRepository
  }

  func execute(requestValue: FetchAccountStatesRequestValue) -> AnyPublisher<MovieAccountStatus, DataTransferError> {
    return accountMovieRepository.fetchMovieStatus(id: requestValue.id)
  }
}
