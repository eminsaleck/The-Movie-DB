//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import UIKit
import MovieDetailsFeatureInterface
import MovieListFeatureInterface
import Common

protocol ExploreCoordinatorProtocol: AnyObject {
    func navigate(with state: ExploreState)
}

protocol ExploreCoordinatorDependencies {
    func buildExploreViewController(coordinator: ExploreCoordinatorProtocol?) -> UIViewController
}

public enum ExploreState: State {
    case exploreInit
    case movieIsPicked(id: Int)
    case allIsPicked(id: Int, title: String)
}


public enum ExploreChildCoordinator {
    case detailMovie
    case movieListByGenre
}
