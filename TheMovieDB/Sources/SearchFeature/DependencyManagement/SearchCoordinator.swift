//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 31.01.2023.
//

import UIKit
import Common
import UI

class SearchCoordinator: NavigationCoordinator, SearchCoordinatorProtocol{
    
    var navigationController: UINavigationController
    private let dependencies: SearchCoordinatorDependencies
    
    private var childCoordinators = [SearchChildCoordinator: Coordinator]()
    
    
    public init(navigationController: UINavigationController, dependencies: DIContainer){
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    public func start() {
        navigate(with: .searchGo)
    }
    
    public func navigate(with state: SearchState) {
        switch state {
        case .searchGo:
            navigateToSearch()
        }
    }
    func navigateToSearch(){
        let searchVC = dependencies.buildSearchViewController(coordinator: self)
        searchVC.navigationItem.title = Localized.searchTitle.localized()
        navigationController.pushViewController(searchVC, animated: true)
    }
}
