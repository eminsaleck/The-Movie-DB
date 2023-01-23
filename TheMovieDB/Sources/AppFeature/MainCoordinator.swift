//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 23.01.2023.
//

import Foundation
import Network
import Persistance
import Common
import UIKit

public enum AppChildCoordinator {
  case signed
}

public class MainCoordinator: Coordinator {

  private let window: UIWindow
  private var childCoordinators = [AppChildCoordinator: Coordinator]()
  private let container: DIContainer

  // MARK: - Initializer
  public init(window: UIWindow, container: DIContainer) {
    self.window = window
    self.container = container
  }

  public func start() {
    navigateToSignedFlow()
  }

  fileprivate func navigateToSignedFlow() {
    let tabBar = UITabBarController()
    let coordinator = SignedCoordinator(tabBarController: tabBar,
                                        DIContainer: container)

    self.window.rootViewController = tabBar
    self.window.makeKeyAndVisible()

    childCoordinators[.signed] = coordinator
    coordinator.start()
  }
}
