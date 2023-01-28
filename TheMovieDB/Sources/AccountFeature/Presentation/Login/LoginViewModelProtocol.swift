//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 27.01.2023.
//

import Foundation
import Combine

protocol LoginViewModelDelegate: AnyObject {
  func loginViewModel(_ loginViewModel: LoginViewModel, didTapLoginButton url: URL)
}

protocol LoginViewModelProtocol {
  func loginDidTapped()
  func changeState(with state: SignInViewState)

  var viewState: CurrentValueSubject<SignInViewState, Never> { get }
  var delegate: LoginViewModelDelegate? { get set }
}

enum SignInViewState: Equatable {
  case initial
  case loading
    case error
}
