//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 31.01.2023.
//

import UIKit
import Common
import SDWebImage

public struct Module {

  private let diContainer: DIContainer

  public init(dependencies: FeatureDependencies) {
    self.diContainer = DIContainer(dependencies: dependencies)
  }

  public func buildSearchCoordinator(in navigationController: UINavigationController) -> Coordinator {
    return diContainer.buildModuleCoordinator(navigationController: navigationController)
  }
}
