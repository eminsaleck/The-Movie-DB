//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.01.2023.
//

import Foundation
import Common
import Combine
import Network

protocol FetchAccountDetailsUseCase {
  func execute() -> AccountRepository
}

final class FetchAccountDetailsUseCaseImplementation: FetchAccountDetailsUseCase {
  private let accountRepository: AccountRepository

  init(accountRepository: AccountRepository) {
    self.accountRepository = accountRepository
  }

  func execute() -> AccountRepository{
      return accountRepository
  }
}
