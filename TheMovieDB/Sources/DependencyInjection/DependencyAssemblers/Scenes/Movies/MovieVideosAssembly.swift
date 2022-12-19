//
//  MovieVideosAssembly.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 17.12.2022.
//

import Swinject
import UpcomingMoviesDomain

final class MovieVideosAssembly: Assembly {

    func assemble(container: Container) {
        container.register(MovieVideosInteractorProtocol.self) { resolver in
            guard let useCaseProvider = resolver.resolve(UseCaseProviderProtocol.self) else {
                fatalError("UseCaseProviderProtocol dependency could not be resolved")
            }
            return MovieVideosInteractor(useCaseProvider: useCaseProvider)
        }

        container.register(MovieVideosViewModelProtocol.self) { (resolver, movieId: Int, movieTitle: String) in
            guard let interactor = resolver.resolve(MovieVideosInteractorProtocol.self) else {
                fatalError("MovieVideosInteractorProtocol dependency could not be resolved")
            }
            return MovieVideosViewModel(movieId: movieId,
                                        movieTitle: movieTitle,
                                        interactor: interactor)
        }
    }

}
