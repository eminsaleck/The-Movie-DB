//
//  NavigationHandler.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 22.11.2022.
//

import Foundation

import UIKit

final class NavigationHandler: NavigationHandlerProtocol {


    private var currentSelectedIndex: Int = 0
    private var rootCoordinators: [RootCoordinator]!
    
    // MARK: - Initializers
    
    init() {
        rootCoordinators = MainTabBarBuilder.buildViewCoordinators()
    }
    
    func initialTransition(from window: UIWindow?) {
        <#code#>
    }
}
