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
    
    // MARK: - Life Cycle
    init(navigationController: UINavigationController, dependencies: AccountCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    deinit {
        print("deinit \(Self.self)")
    }
    
    public func start() {
        navigate(with: .accountFeatureInit)
    }
    
    // MARK: - Navigation
    
    public func navigate(with step: AccountState) {
        switch step {
        case .accountFeatureInit:
            navigateToAccountFeature()
        }
    }
    
    fileprivate func navigateToAccountFeature() {
        let accountVC = dependencies.buildAccountViewController(coordinator: self)
        navigationController.pushViewController(accountVC, animated: true)
    }
}
