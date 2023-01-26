//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.01.2023.
//

import Combine
import Network

public protocol AccountRemoteDataSource {
  func getAccountDetails(session: String) -> AnyPublisher<AccountDTO, DataTransferError>
}

