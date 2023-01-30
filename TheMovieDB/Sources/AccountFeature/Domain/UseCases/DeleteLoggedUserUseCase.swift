//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.01.2023.
//

import Foundation
import Common

protocol DeleteLoggedUserUseCase {
  func execute() -> LoggedUserRepositoryProtocol
}

final class DeleteLoggedUserUseCaseImplementation: DeleteLoggedUserUseCase {
  private let loggedRepository: LoggedUserRepositoryProtocol

  init(loggedRepository: LoggedUserRepositoryProtocol) {
    self.loggedRepository = loggedRepository
  }

  func execute() -> LoggedUserRepositoryProtocol{
    loggedRepository
  }
}
