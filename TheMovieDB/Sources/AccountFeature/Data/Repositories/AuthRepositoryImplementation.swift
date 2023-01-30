//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.01.2023.
//

import Combine
import Foundation
import Network
import Common

final class AuthRepositoryImplementation: AuthRepository {
    
  private let dependencies: AuthDependencies

    init(dependencies: AuthDependencies){
    self.dependencies = dependencies
  }
    
    func requestToken() -> AnyPublisher<NewRequestToken, DataTransferError> {
        return dependencies.remoteDataSource.requestToken()
        .tryMap { result -> NewRequestToken in
            let newToken = try self.dependencies.tokenMapper.mapRequestToken(model: result)
            self.dependencies.requestTokenRepository.saveRequestToken (result.token)
          return newToken
        }
        .mapError { error -> DataTransferError in
          return DataTransferError.noResponse
        }
        .eraseToAnyPublisher()
    }

    func createSession() -> AnyPublisher<NewSession, DataTransferError> {
        guard let requestToken = dependencies.requestTokenRepository.getRequestToken() else {
        return Fail(error: DataTransferError.noResponse).eraseToAnyPublisher()
      }
        return dependencies.remoteDataSource.createSession(requestToken: requestToken)
        .map {
            self.dependencies.accessTokenRepository.saveAccessToken($0.sessionId)
          return NewSession(success: $0.success, sessionId: $0.sessionId)
        }
        .eraseToAnyPublisher()
    }
}
