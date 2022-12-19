//
//  MovieReviewsAssembly.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 17.12.2022.
//

import Swinject
import UpcomingMoviesDomain

final class MovieReviewsAssembly: Assembly {

    func assemble(container: Container) {
        container.register(MovieReviewsInteractorProtocol.self) { resolver in
            guard let useCaseProvider = resolver.resolve(UseCaseProviderProtocol.self) else {
                fatalError("UseCaseProviderProtocol dependency could not be resolved")
            }
            return MovieReviewsInteractor(useCaseProvider: useCaseProvider)
        }

        container.register(MovieReviewsViewModelProtocol.self) { (resolver, movieId: Int, movieTitle: String) in
            guard let interactor = resolver.resolve(MovieReviewsInteractorProtocol.self) else {
                fatalError("MovieReviewsInteractorProtocol dependency could not be resolved")
            }
            return MovieReviewsViewModel(movieId: movieId,
                                         movieTitle: movieTitle,
                                         interactor: interactor)
        }
    }

}
