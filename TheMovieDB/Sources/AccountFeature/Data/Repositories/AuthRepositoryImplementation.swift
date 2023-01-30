//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.01.2023.
//

import Combine
import Foundation
import Network
import Networking
import Common

final class AuthRepositoryImplementation {
  private let remoteDataSource: AuthRemoteDataSource
  private let requestTokenRepository: RequestTokenRepositoryProtocol
  private let accessTokenRepository: AccessTokenRepositoryProtocol
  private let tokenMapper: RequestTokenMapperProtocol

  init(remoteDataSource: AuthRemoteDataSource,
       requestTokenRepository: RequestTokenRepositoryProtocol,
       accessTokenRepository: AccessTokenRepositoryProtocol,
       tokenMapper: RequestTokenMapperProtocol) {
    self.remoteDataSource = remoteDataSource
    self.requestTokenRepository = requestTokenRepository
    self.accessTokenRepository = accessTokenRepository
    self.tokenMapper = tokenMapper
  }
}

extension AuthRepositoryImplementation: AuthRepository {


  func requestToken() -> AnyPublisher<NewRequestToken, DataTransferError> {
    return remoteDataSource.requestToken()
      .tryMap { result -> NewRequestToken in
        let newToken = try self.tokenMapper.mapRequestToken(model: result)
        self.requestTokenRepository.saveRequestToken (result.token)
        return newToken
      }
      .mapError { error -> DataTransferError in
        return DataTransferError.noResponse
      }
      .eraseToAnyPublisher()
  }

  func createSession() -> AnyPublisher<NewSession, DataTransferError> {
    guard let requestToken = requestTokenRepository.getRequestToken() else {
      return Fail(error: DataTransferError.noResponse).eraseToAnyPublisher()
    }
    return remoteDataSource.createSession(requestToken: requestToken)
      .map {
        self.accessTokenRepository.saveAccessToken($0.sessionId)
        return NewSession(success: $0.success, sessionId: $0.sessionId)
      }
      .eraseToAnyPublisher()
  }
}
