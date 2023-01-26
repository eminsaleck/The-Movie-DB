//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.01.2023.
//

import Foundation
import Common
import Network

protocol FetchAccountDetailsUseCase {
  func execute() -> AnyPublisher<Account, DataTransferError>
}

final class DefaultFetchAccountDetailsUseCase: FetchAccountDetailsUseCase {
  private let accountRepository: AccountRepository

  init(accountRepository: AccountRepository) {
    self.accountRepository = accountRepository
  }

  func execute() -> AnyPublisher<Account, DataTransferError> {
    return accountRepository.getAccountDetails()
  }
}
