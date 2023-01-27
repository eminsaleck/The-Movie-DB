//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 27.01.2023.
//

import Foundation

protocol SignInViewModelDelegate: AnyObject {
  func signInViewModel(_ signInViewModel: SignInViewModel, didTapSignInButton url: URL)
}
