//
//  Account.swift
//  NetworkInfrastructure
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

public struct Account {

    public let accountId: Int
    public let sessionId: String

    public init(accountId: Int, sessionId: String) {
      self.accountId = accountId
      self.sessionId = sessionId
    }
}
