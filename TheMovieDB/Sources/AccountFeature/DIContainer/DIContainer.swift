//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 22.01.2023.
//

import UIKit
import Common
import MovieListFeatureInterface

final class DIContainer {
    
    private let dependencies: ModuleDependencies
    
    init(dependencies: ModuleDependencies) {
        self.dependencies = dependencies
    }
    
    func buildModuleCoordinator(navigationController: UINavigationController) -> Coordinator {
        return AccountCoordinator(navigationController: navigationController, dependencies: self)
    }
}

extension DIContainer: AccountCoordinatorDependencies {
    func buildAccountViewController(coordinator: AccountCoordinatorProtocol?) -> UIViewController {

        return AccountViewController()
    }
}
