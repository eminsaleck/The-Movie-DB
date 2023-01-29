//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 27.01.2023.
//

import Foundation
import Combine

public protocol AuthPermissionViewModelDelegate: AnyObject {
  func authPermissionViewModelDelegate(_ signedIn: Bool)
}

protocol AuthPermissionViewModelProtocol {
  func signIn()
  var authPermissionURL: URL { get }
  var delegate: AuthPermissionViewModelDelegate? { get set }
}

final class AuthPermissionViewModel: AuthPermissionViewModelProtocol {
    
  weak var delegate: AuthPermissionViewModelDelegate?
  private let didSignIn = PassthroughSubject<Bool, Never>()
  let authPermissionURL: URL
  private var bag = Set<AnyCancellable>()

  init(url: URL) {
    authPermissionURL = url
    subscribe()
  }

  func signIn() {
    didSignIn.send(true)
  }

  private func subscribe() {
    didSignIn
      .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] signedIn in
        self?.delegate?.authPermissionViewModelDelegate(signedIn)
      })
      .store(in: &bag)
  }
}
