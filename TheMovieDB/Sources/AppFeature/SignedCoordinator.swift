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
    case account
    case search
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
        accountNavigation.tabBarItem = UITabBarItem(title: Localized.accountTitle.localized(),
                                                    image: UIImage(systemName: "person.crop.circle.fill"), tag: 3)
        buildAccountCoordinator(in: accountNavigation)
        
        let searchNavigation = UINavigationController()
        searchNavigation.tabBarItem = UITabBarItem(title: Localized.searchTabbar.localized(),
                                                   image: UIImage(systemName: "magnifyingglass"), tag: 2)
        buildSearchScene(in: searchNavigation)
        
        tabBarController.setViewControllers([searchNavigation,accountNavigation], animated: true)
        
        
    }
}

extension SignedCoordinator {
    
    // MARK: - Account Scene
    private func buildAccountCoordinator(in navigation: UINavigationController) {
        let accountModule = DIContainer.buildAccountModule()
        let coordinator = accountModule.buildAccountCoordinator(in: navigation)
        coordinator.start()
        childCoordinators[.account] = coordinator
    }
    // MARK: - Search Scene
    private func buildSearchScene(in navigation: UINavigationController) {
      let searchModule = DIContainer.buildSearchModule()
      let coordinator = searchModule.buildSearchCoordinator(in: navigation)
      coordinator.start()
      childCoordinators[.search] = coordinator
    }
}
