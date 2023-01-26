//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.01.2023.
//

import Combine
import Network

public protocol AccountRepository {
  func getAccountDetails() -> AnyPublisher<Account, DataTransferError>
}
