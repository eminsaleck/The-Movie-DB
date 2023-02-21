//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 20.02.2023.
//

import UIKit
import Common

class DIContainer{
    
    private let dependencies: FeatureDependencies
    
    init(dependencies: FeatureDependencies) {
        self.dependencies = dependencies
    }
    
    func buildModuleCoordinator(navigationController: UINavigationController) -> Coordinator {
        return ExploreCoordinator(navigationController: navigationController, dependencies: self)
    }
}

extension DIContainer: ExploreCoordinatorDependencies{
    func buildExploreViewController(coordinator: ExploreCoordinatorProtocol?) -> UIViewController {
        let vc = UIViewController(nibName: nil, bundle: nil)
        vc.view.backgroundColor = .red
        return vc
    }
}
