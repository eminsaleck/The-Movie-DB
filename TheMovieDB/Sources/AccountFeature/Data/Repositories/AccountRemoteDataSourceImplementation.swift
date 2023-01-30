//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.01.2023.
//

import Combine
import Networking
import Network

final class AccountRemoteDataSourceImplementation: AccountRemoteDataSource {
  private let dataTransferService: DataTransferServiceProtocol
  
  init(dataTransferService: DataTransferServiceProtocol) {
    self.dataTransferService = dataTransferService
  }
  
  func getAccountDetails(session: String) -> AnyPublisher<AccountDTO, DataTransferError> {
    let endpoint = Endpoint<AccountDTO>(
      path: "3/account",
      method: .get,
      queryParameters: [
        "session_id": session
      ]
    )
    return dataTransferService.request(with: endpoint)
  }
}
