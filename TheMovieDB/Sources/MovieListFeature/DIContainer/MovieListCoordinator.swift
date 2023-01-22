//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 22.01.2023.
//

import UI
import Common
import MovieDetailsFeatureInterface
import MovieListFeatureInterface
import UIKit

public class MovieListCoordinator: MovieListCoordinatorProtocol {
    
    public var navigationController: UINavigationController
    
    public weak var delegate: MovieListCoordinatorDelegate?
    
    private let dependencies: MovieListCoordinatorDependencies
    
    private var childCoordinators = [MovieListChildCoordinator: Coordinator]()
    
    init(navigationController: UINavigationController,
         dependencies: MovieListCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    
    public func navigate(to step: MovieListFeatureInterface.MovieListState) {
        //
    }
}
