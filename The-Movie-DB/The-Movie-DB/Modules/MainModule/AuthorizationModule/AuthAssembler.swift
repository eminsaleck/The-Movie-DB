//
//  AuthAssembler.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 01.11.2022.
//

import UIKit

final class AuthAssembler: AssemblerProtocol {
  
  func assembly() -> AuthController {
    let authViewModel = AuthViewModel()
    let authViewController = AuthController()
    authViewController.viewModel = authViewModel
    
    return authViewController
  }
}
