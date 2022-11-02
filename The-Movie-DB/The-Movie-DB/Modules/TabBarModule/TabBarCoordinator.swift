//
//  TabBarCoordinator.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 01.11.2022.
//

import UIKit

protocol TabCoordinatorProtocol: Coordinator {
    var tabBarController: UITabBarController { get set }
    func selectPage(_ page: TabBarPage)
    func setSelectedIndex(_ index: Int)
    func currentPage() -> TabBarPage?
}

class TabCoordinator: NSObject, Coordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    var type: CoordinatorType { .tab }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }
    
    func start() {
        let pages: [TabBarPage] = [.profile, .favourites, .search, .main]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        
        // Initialization of ViewControllers or these pages
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        
        prepareTabBarController(withTabControllers: controllers)
    }
    
    deinit {
        print("TabCoordinator deinit")
    }
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        tabBarController.delegate = self
        tabBarController.setViewControllers(tabControllers, animated: true)
        tabBarController.selectedIndex = TabBarPage.main.pageOrderNumber()
        tabBarController.tabBar.isTranslucent = false
        navigationController.viewControllers = [tabBarController]
    }
    
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)
        
        navController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                     image: page.icon(),
                                                     tag: page.pageOrderNumber())
        
        switch page {
        case .main:
            // If needed: Each tab bar flow can have it's own Coordinator.
            let mainVC = MainCoordinator(navController)         
            mainVC.start()
           
        case .search:
            let searchVC = SearchController()
            searchVC.didSendEventClosure = { [weak self] event in
                switch event {
                case .search:
                    self?.selectPage(.profile)
                }
            }
            navController.pushViewController(searchVC, animated: true)
            
        case .favourites:
            let mainVC = MainCoordinator(navController)
            mainVC.start()
            
        case .profile:
            let profileVC = ProfileController()
            profileVC.didSendEventClosure = { [weak self] event in
                switch event {
                case .profile:
                    self?.finish()
                }
            }
            
            navController.pushViewController(profileVC, animated: true)
        }
        
        return navController
    }
    
    func currentPage() -> TabBarPage? { TabBarPage.init(index: tabBarController.selectedIndex) }
    
    func selectPage(_ page: TabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func setSelectedIndex(_ index: Int) {
        guard let page = TabBarPage.init(index: index) else { return }
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
}

// MARK: - UITabBarControllerDelegate
extension TabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        tabBarController.tabBar.backgroundColor = .red
    }
}
