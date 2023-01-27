//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Foundation

public final class LoggedUserRepository {
  let dataSource: LoggedUserLocalDataSource

  public init(dataSource: LoggedUserLocalDataSource) {
    self.dataSource = dataSource
  }
}

extension LoggedUserRepository: LoggedUserRepositoryProtocol {

  public func saveUser(userId: Int, sessionId: String) {
    dataSource.saveUser(userId: userId, sessionId: sessionId)
  }

  public func getUser() -> AccountDomain? {
    return dataSource.getUser()
  }

  public func deleteUser() {
    dataSource.deleteUser()
  }
}
