//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 27.01.2023.
//

import Foundation
import Combine

protocol SignInViewModelDelegate: AnyObject {
  func signInViewModel(_ signInViewModel: SignInViewModel, didTapSignInButton url: URL)
}

protocol SignInViewModelProtocol {
  func signInDidTapped()
  func changeState(with state: SignInViewState)

  var viewState: CurrentValueSubject<SignInViewState, Never> { get }
  var delegate: SignInViewModelDelegate? { get set }
}

enum SignInViewState: Equatable {
  case initial
  case loading
    case error
}
