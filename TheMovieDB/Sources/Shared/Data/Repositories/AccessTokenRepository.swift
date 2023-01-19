//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Foundation

public final class AccessTokenRepository {
  private let dataSource: AccessTokenLocalDataSource

  public init(dataSource: AccessTokenLocalDataSource) {
    self.dataSource = dataSource
  }
}

extension AccessTokenRepository: AccessTokenRepositoryProtocol {
  public func saveAccessToken(_ token: String) {
    dataSource.saveAccessToken(token)
  }

  public func getAccessToken() -> String {
    dataSource.getAccessToken()
  }
}
