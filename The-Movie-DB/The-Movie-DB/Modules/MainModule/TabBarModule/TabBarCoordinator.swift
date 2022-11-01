//
//  TabBarCoordinator.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 01.11.2022.
//

import UIKit

final class TabBarCoordinator: CoordinatorProtocol {
  
  let window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
  }
  
  func start() {
    let tabBarController = TabBarAssembler().assembly()
    tabBarController.coordinator = self
    switchRootViewController(vc: tabBarController, options: .transitionFlipFromLeft)
  }
  
  func switchRootViewController(vc: UIViewController, animated: Bool = true, options: UIView.AnimationOptions) {
    window.rootViewController = vc
    window.makeKeyAndVisible()

    UIView.transition(
      with: window,
      duration: 0.6,
      options: [options],
      animations: nil,
      completion: nil)
  }
  
  func openHome(navController: UINavigationController) -> MainController {
    let mainCoordinator = MainCoordinator(navController: navController)
    return mainCoordinator.openHome()
  }
}
