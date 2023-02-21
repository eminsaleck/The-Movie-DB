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
    private let exploreViewModel: ExploreViewModel
    
    init(dependencies: FeatureDependencies) {
        self.dependencies = dependencies
        exploreViewModel = ExploreViewModel()
    }
    
    func buildModuleCoordinator(navigationController: UINavigationController) -> Coordinator {
        return ExploreCoordinator(navigationController: navigationController, dependencies: self)
    }
}

extension DIContainer: ExploreCoordinatorDependencies{
    func buildExploreViewController(coordinator: ExploreCoordinatorProtocol?) -> UIViewController {
        exploreViewModel.coordinator = coordinator
        let exploreVC = ExploreViewController(viewModel: exploreViewModel)
        return exploreVC
    }
}
