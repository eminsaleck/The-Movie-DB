//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.01.2023.
//

import Foundation
import Combine
import Common
import Network

protocol CreateTokenUseCase {
  func execute() -> AnyPublisher<URL, DataTransferError>
}

final class DefaultCreateTokenUseCase: CreateTokenUseCase {
  private let authRepository: AuthRepository

  init(authRepository: AuthRepository) {
    self.authRepository = authRepository
  }

  func execute() -> AnyPublisher<URL, DataTransferError> {
    authRepository.requestToken()
      .map {
        return $0.url
      }
      .eraseToAnyPublisher()
  }
}
