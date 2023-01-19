//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Foundation

public protocol LoggedUserLocalDataSource {
  func saveUser(userId: Int, sessionId: String)
  func getUser() -> Account?
  func deleteUser()
}
