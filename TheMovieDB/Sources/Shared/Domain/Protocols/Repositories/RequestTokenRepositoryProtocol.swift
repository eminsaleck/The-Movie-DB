//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Foundation

public protocol RequestTokenRepositoryProtocol {
  func saveRequestToken(_ token: String)
  func getRequestToken() -> String?
}
