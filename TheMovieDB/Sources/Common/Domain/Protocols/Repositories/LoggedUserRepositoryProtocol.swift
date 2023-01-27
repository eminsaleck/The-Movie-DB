//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Foundation

public protocol LoggedUserRepositoryProtocol {
  func saveUser(userId: Int, sessionId: String) // MARK: - TODO, use userId as String
  func getUser() -> AccountDomain?
  func deleteUser()
}
