//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import UIKit
import Common
import UI

public enum SignedChildCoordinator {
  case main
  case popular
  case search
  case account
}

public class SignedCoordinator: Coordinator {
  private let tabBarController: UITabBarController
  private var childCoordinators = [SignedChildCoordinator: Coordinator]()
  private let DIContainer: DIContainer

    
  public init(tabBarController: UITabBarController, DIContainer: DIContainer) {
    self.tabBarController = tabBarController
    self.DIContainer = DIContainer
  }

  public func start() {
    showMainFeatures()
  }

  fileprivate func showMainFeatures() {
    let accountNavigation = UINavigationController()
    accountNavigation.tabBarItem = UITabBarItem(title: Strings.accountTitle.localized(),
                                                image: UIImage(systemName: "person.crop.circle.fill"), tag: 3)
    buildAccountCoordinator(in: accountNavigation)

    tabBarController.setViewControllers([accountNavigation], animated: true)
  }
}

public extension SignedCoordinator {
    
    // MARK: - Account Scene
    fileprivate func buildAccountCoordinator(in navigation: UINavigationController) {
      let accountModule = DIContainer.buildAccountModule()
      let coordinator = accountModule.buildAccountCoordinator(in: navigation)
      coordinator.start()
      childCoordinators[.account] = coordinator
    }
}
