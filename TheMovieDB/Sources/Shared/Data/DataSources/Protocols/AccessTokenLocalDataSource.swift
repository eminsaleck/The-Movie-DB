//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Foundation

public protocol AccessTokenLocalDataSource {
  func saveAccessToken(_ token: String)
  func getAccessToken() -> String
}
