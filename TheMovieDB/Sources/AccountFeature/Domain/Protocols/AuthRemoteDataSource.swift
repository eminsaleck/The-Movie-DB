//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.01.2023.
//

import Combine
import Network

protocol AuthRemoteDataSource {
  func requestToken() -> AnyPublisher<NewRequestTokenDTO, DataTransferError>
  func createSession(requestToken: String) -> AnyPublisher<NewSessionDTO, DataTransferError>
}
