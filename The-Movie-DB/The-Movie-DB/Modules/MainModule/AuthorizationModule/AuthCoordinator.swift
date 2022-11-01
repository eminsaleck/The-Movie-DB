//
//  AuthCoordinator.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 01.11.2022.
//

import UIKit

protocol AuthFlow {
  func coordinateToTabBar()
  func logout()
}

final class AuthCoordinator: CoordinatorProtocol, AuthFlow {

  
  let window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
  }
  
  func start() {
    let authViewController = AuthAssembler().assembly()
    authViewController.coordinator = self
    window.rootViewController = authViewController
    window.makeKeyAndVisible()
  }
  
  func logout() {
    let authViewController = AuthAssembler().assembly()
    authViewController.coordinator = self
  }
  
  func coordinateToTabBar() {
    let tabBarCoordinator = TabBarCoordinator(window: window)
    coordinate(to: tabBarCoordinator)
  }
  
}
