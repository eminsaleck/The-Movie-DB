//
//  SceneDelegate.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      guard let windowScene = (scene as? UIWindowScene) else { return }
      let window = UIWindow(windowScene: windowScene)
      self.window = window
      
      let appCoordinator = AppCoordinator(window: window)
      appCoordinator.start()
    }
}

