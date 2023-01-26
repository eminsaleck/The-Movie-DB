//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.01.2023.
//

import Combine
import Network

protocol AuthRepository {
  func requestToken() -> AnyPublisher<NewRequestToken, DataTransferError>
  func createSession() -> AnyPublisher<NewSession, DataTransferError>
}
