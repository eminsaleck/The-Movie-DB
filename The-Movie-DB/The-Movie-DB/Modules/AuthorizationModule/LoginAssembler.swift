//
//  AuthAssembler.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 01.11.2022.
//

import UIKit

final class LoginAssembler: AssemblerProtocol {
  
  func assembly() -> LoginController {
    let loginViewModel = LoginViewModel()
    let loginController = LoginController()
      loginController.viewModel = loginViewModel
    
    return loginController
  }
}
