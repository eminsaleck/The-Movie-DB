//
//  File 2.swift
//  
//
//  Created by LEMIN DAHOVICH on 23.01.2023.
//

import UIKit
import UI
import Common
import MovieDetailsFeatureInterface

public class MovieDetailCoordinator: MovieDetailCoordinatorProtocol {
    
    public weak var delegate: MovieDetailCoordinatorDelegate?
    
    public let navigationController: UINavigationController
    
    private let dependencies: MovieDetailCoordinatorDependencies
    
    init(navigationController: UINavigationController,
         dependencies: MovieDetailCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    public func navigate(with state: MovieDetailsState) {
      switch state {
      case .movieDetailsIsRequired(let showId, let closures):
        movieDetailsFeature(with: showId, closures: closures)
      case .detailViewDidFinish:
        delegate?.movieDetailCoordinatorDidFinish()
      }
    }
    
    private func movieDetailsFeature(with id: Int, closures: MovieDetailViewModelClosures? = nil) {
      let detailVC = dependencies.buildMovieDetailsViewController(with: id, coordinator: self, closures: closures)
      detailVC.hidesBottomBarWhenPushed = true
      navigationController.pushViewController(detailVC, animated: true)
    }
    
}
