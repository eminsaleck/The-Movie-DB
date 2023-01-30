//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.01.2023.
//

import Combine
import Network
import Networking

final class AuthRemoteDataSourceImplementation: AuthRemoteDataSource {
  private let dataTransferService: DataTransferServiceProtocol

  init(dataTransferService: DataTransferServiceProtocol) {
    self.dataTransferService = dataTransferService
  }

  func requestToken() -> AnyPublisher<NewRequestTokenDTO, DataTransferError> {
    let endpoint = Endpoint<NewRequestTokenDTO>(
      path: "3/authentication/token/new",
      method: .get
    )
    return dataTransferService.request(with: endpoint)
  }

    
  func createSession(requestToken: String) -> AnyPublisher<NewSessionDTO, DataTransferError> {
    let endpoint = Endpoint<NewSessionDTO>(
      path: "3/authentication/session/new",
      method: .post,
      queryParameters: [
        "request_token": requestToken
      ]
    )
    return dataTransferService.request(with: endpoint)
  }
}
