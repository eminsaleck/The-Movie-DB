//
//  SceneDelegate.swift
//  Matching game
//
//  Created by LEMIN DAHOVICH on 12.09.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navigationHandler: NavigationHandlerProtocol?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        navigationHandler = DIContainer.shared.resolve()
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
}

