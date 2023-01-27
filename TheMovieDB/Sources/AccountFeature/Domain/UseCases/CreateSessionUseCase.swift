//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.01.2023.
//

import Combine
import Network
import Common

protocol CreateSessionUseCase {
  func execute() -> AuthRepository
}

final class DefaultCreateSessionUseCase: CreateSessionUseCase {
  private let authRepository: AuthRepository

  init(authRepository: AuthRepository) {
    self.authRepository = authRepository
  }

  func execute() -> AuthRepository {
      authRepository
  }
}
