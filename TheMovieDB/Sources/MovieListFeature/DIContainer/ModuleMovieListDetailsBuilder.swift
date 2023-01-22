//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.01.2023.
//

import UIKit
import Common
import MovieListFeatureInterface

public struct Module: ModuleMovieListDetailsBuilder {

  private let diContainer: DIContainer

  public init(dependencies: ModuleDependencies) {
    self.diContainer = DIContainer(dependencies: dependencies)
  }

  public func buildModuleCoordinator(in navigationController: UINavigationController,
                                     delegate: MovieListCoordinatorDelegate?) -> MovieListCoordinatorProtocol {
    return diContainer.buildModuleCoordinator(navigationController: navigationController, delegate: delegate)
  }
}
