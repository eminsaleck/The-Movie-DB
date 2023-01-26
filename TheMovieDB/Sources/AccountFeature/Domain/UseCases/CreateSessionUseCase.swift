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
  func execute() -> AnyPublisher<Void, DataTransferError>
}

final class DefaultCreateSessionUseCase: CreateSessionUseCase {
  private let authRepository: AuthRepository

  init(authRepository: AuthRepository) {
    self.authRepository = authRepository
  }

  func execute() -> AnyPublisher<Void, DataTransferError> {
    return authRepository.createSession()
      .map { _ in
        return (())
      }
      .eraseToAnyPublisher()
  }
}
