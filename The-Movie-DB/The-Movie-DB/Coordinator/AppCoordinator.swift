//
//  AppCoordinator.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 28.10.2022.
//

import UIKit


final class AppCoordinator: CoordinatorProtocol {
  
  let window: UIWindow

  init(window: UIWindow) {
    self.window = window
  }
  
  func start() {
    let authCoordinator = AuthCoordinator(window: window)
    coordinate(to: authCoordinator)
  }
}

