//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 22.01.2023.
//

import UIKit
import Common
import MovieListFeatureInterface

class AccountCoordinator: NavigationCoordinator, AccountCoordinatorProtocol {
    
    public var navigationController: UINavigationController
    
    private var childCoordinators = [AccountChildCoordinator: Coordinator]()
    
    private let dependencies: AccountCoordinatorDependencies
    
    init(navigationController: UINavigationController, dependencies: AccountCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    public func start() {
        navigate(with: .accountFeatureInit)
    }
    
    public func navigate(with state: AccountState) {
        switch state {
        case .accountFeatureInit:
            navigateToAccountFeature()
            
        case .loginInIsPicked(url: let url, delegate: let delegate):
            navigateToAuthPermission(url: url, delegate: delegate)
            
        case .authorizationIsComplete:
            navigationController.presentedViewController?.dismiss(animated: true)
            
        case .favourites:
            navigateToFavorites()
        case .watchList:
            navigateToWatchList()
        }
    }
    
}

    //MARK: - navigation to picked cells
extension AccountCoordinator{
    private func navigateToAccountFeature() {
        let accountVC = dependencies.buildAccountViewController(coordinator: self)
        navigationController.pushViewController(accountVC, animated: true)
    }
    
    private func navigateToAuthPermission(url: URL, delegate: AuthPermissionViewModelDelegate?){
        let authViewController = dependencies.buildAuthPermissionViewController(url: url, delegate: delegate)
        
        let embedNavController = UINavigationController(rootViewController: authViewController)
        embedNavController.presentationController?.delegate = authViewController
        
        navigationController.present(embedNavController, animated: true)
    }
    
    private func navigateToFavorites() {
     print("navigateToFavorites")
    }

    private func navigateToWatchList() {
        print("navigateToWatchList")

    }
}
