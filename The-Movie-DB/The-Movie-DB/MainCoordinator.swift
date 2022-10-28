//
//  MainCoordinator.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 28.10.2022.
//

import UIKit

protocol MainFlow { }

final class MainCoordinator: CoordinatorProtocol, MainFlow {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewController = ViewController()
        viewController.coordinator = self
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
