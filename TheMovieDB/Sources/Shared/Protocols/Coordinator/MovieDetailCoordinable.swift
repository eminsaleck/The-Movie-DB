//
//  MovieDetailCoordinable.swift
//  TheMovieDB
//
//  Created by LEMIN DAHOVICH on 10.11.2022.
//

import Domain

public protocol MovieDetailCoordinable {

     func showMovieDetail(for movie: Movie)

}

public extension MovieDetailCoordinable where Self: Coordinator {

    public func showMovieDetail(for movie: Movie) {
        let coordinator = MovieDetailCoordinator(navigationController: navigationController)

        coordinator.movieInfo = .complete(movie: movie)
        coordinator.parentCoordinator = unwrappedParentCoordinator

        unwrappedParentCoordinator.childCoordinators.append(coordinator)
        coordinator.start()
    }

}
