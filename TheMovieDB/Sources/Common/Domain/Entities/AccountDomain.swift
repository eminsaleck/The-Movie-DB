//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Foundation

public struct AccountDomain {
  public let id: Int
  public let sessionId: String

  public init(id: Int, sessionId: String) {
    self.id = id
    self.sessionId = sessionId
  }
}
