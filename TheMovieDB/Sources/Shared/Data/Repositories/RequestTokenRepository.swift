//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Foundation

public final class RequestTokenRepository {
  private let dataSource: RequestTokenLocalDataSource

  public init(dataSource: RequestTokenLocalDataSource) {
    self.dataSource = dataSource
  }
}

extension RequestTokenRepository: RequestTokenRepositoryProtocol {
  public func saveRequestToken(_ token: String) {
    dataSource.saveRequestToken(token)
  }

  public func getRequestToken() -> String? {
    dataSource.getRequestToken()
  }
}
