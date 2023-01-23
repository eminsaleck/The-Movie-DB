//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 23.01.2023.
//

import UIKit
import Common
import MovieDetailsFeatureInterface


public struct Module: ModuleMovieDetailsBuilderProtocol{
    
    private let diContainer: DIContainer
    
    public init(dependencies: ModuleDependencies) {
        self.diContainer = DIContainer(dependencies: dependencies)
    }
    
    public func buildModuleCoordinator(in navigationController: UINavigationController,
                                       delegate: MovieDetailCoordinatorDelegate?) -> MovieDetailCoordinatorProtocol {
        return diContainer.buildModuleCoordinator(navigationController: navigationController, delegate: delegate)
    }
}


