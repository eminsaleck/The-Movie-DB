//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 27.01.2023.
//

import Foundation

public protocol AuthPermissionViewModelDelegate: AnyObject {
  func authPermissionViewModel(didSignedIn signedIn: Bool)
}


protocol AuthPermissionViewModelProtocol {
  func signIn()
  var authPermissionURL: URL { get }
  var delegate: AuthPermissionViewModelDelegate? { get set }
}
