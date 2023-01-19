//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import UIKit
import Shared
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

    
  public init(tabBarController: UITabBarController, appDIContainer: DIContainer) {
    self.tabBarController = tabBarController
    self.DIContainer = DIContainer
  }

  public func start() {
    showMainFeatures()
  }

  fileprivate func showMainFeatures() {
    let mainNavigation = UINavigationController()
    mainNavigation.tabBarItem = UITabBarItem(title: Strings.mainTabbar.localized(),
                                              image: UIImage(systemName: "calendar.badge.clock"), tag: 0)
    buildTodayScene(in: mainNavigation)

    let popularNavigation = UINavigationController()
    popularNavigation.tabBarItem = UITabBarItem(title: Strings.popularTabbar.localized(),
                                                image: UIImage(systemName: "star.fill"), tag: 1)
    buildPopularScene(in: popularNavigation)

    let searchNavigation = UINavigationController()
    searchNavigation.tabBarItem = UITabBarItem(title: Strings.searchTabbar.localized(),
                                               image: UIImage(systemName: "magnifyingglass"), tag: 2)
    buildSearchScene(in: searchNavigation)

    let accountNavigation = UINavigationController()
    accountNavigation.tabBarItem = UITabBarItem(title: Strings.accountTitle.localized(),
                                                image: UIImage(systemName: "person.crop.circle.fill"), tag: 3)
    buildAccountCoordinator(in: accountNavigation)

    tabBarController.setViewControllers([mainNavigation,
                                         popularNavigation,
                                         searchNavigation,
                                         accountNavigation], animated: true)
  }
}

public extension SignedCoordinator {
    // MARK: - Build Main Scene
    fileprivate func buildTodayScene(in navigation: UINavigationController) {
      let todayModule = DIContainer.buildAiringTodayModule()
      let airingCoordinator = todayModule.buildAiringTodayCoordinator(in: navigation)
      airingCoordinator.start()
      childCoordinators[.main] = airingCoordinator
    }

    // MARK: - Build Popular Scene
    fileprivate func buildPopularScene(in navigation: UINavigationController) {
      let popularModule = DIContainer.buildPopularModule()
      let coordinator = popularModule.buildPopularCoordinator(in: navigation)
      coordinator.start()
      childCoordinators[.popular] = coordinator
    }

    // MARK: - Build Search Scene
    fileprivate func buildSearchScene(in navigation: UINavigationController) {
      let searchModule = DIContainer.buildSearchModule()
      let coordinator = searchModule.buildSearchCoordinator(in: navigation)
      coordinator.start()
      childCoordinators[.search] = coordinator
    }

    // MARK: - Build Account Scene
    fileprivate func buildAccountCoordinator(in navigation: UINavigationController) {
      let accountModule = DIContainer.buildAccountModule()
      let coordinator = accountModule.buildAccountCoordinator(in: navigation)
      coordinator.start()
      childCoordinators[.account] = coordinator
    }
}
