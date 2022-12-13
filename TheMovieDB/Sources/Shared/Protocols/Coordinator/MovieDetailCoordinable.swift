//
//  MovieDetailCoordinable.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 10.11.2022.
//

import UpcomingMoviesDomain

protocol MovieDetailCoordinable {

    func showMovieDetail(for movie: Movie)

}

extension MovieDetailCoordinable where Self: Coordinator {

    func showMovieDetail(for movie: Movie) {
        let coordinator = MovieDetailCoordinator(navigationController: navigationController)

        coordinator.movieInfo = .complete(movie: movie)
        coordinator.parentCoordinator = unwrappedParentCoordinator

        unwrappedParentCoordinator.childCoordinators.append(coordinator)
        coordinator.start()
    }

}
