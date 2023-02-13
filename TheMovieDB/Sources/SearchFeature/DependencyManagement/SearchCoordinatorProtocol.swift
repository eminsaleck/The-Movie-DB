//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 31.01.2023.
//

import UIKit
import MovieDetailsFeatureInterface
import MovieListFeatureInterface
import Common

protocol SearchCoordinatorProtocol: AnyObject {
    func navigate(with state: SearchState)
}

protocol SearchCoordinatorDependencies {
    func buildSearchViewController(coordinator: SearchCoordinatorProtocol?) -> UIViewController
}

public enum SearchState: State {
    case searchInit
    case movieIsPicked(id: Int)
}


public enum SearchChildCoordinator {
    case detailShow
}
