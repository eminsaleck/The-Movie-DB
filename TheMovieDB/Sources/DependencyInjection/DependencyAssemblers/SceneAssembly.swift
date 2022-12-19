//
//  SceneAssembly.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 17.12.2022.
//

import Foundation
import Swinject

final class SceneAssembly: Assembly {

    func assemble(container: Container) {
        let assemblies: [Assembly] = [
            SplashAssembly(),
            AccountAssembly(),
            AuthenticationAssembly(),
            ProfileAssembly(),
            SavedMoviesAssembly(),
            CustomListsAssembly(),
            CustomListDetailAssembly(),
            UpcomingMoviesAssembly(),
            MovieDetailAssembly(),
            SearchMoviesAssembly(),
            MovieListAssembly(),
            MovieCreditsAssembly(),
            MovieVideosAssembly(),
            MovieReviewsAssembly(),
            MovieReviewDetailAssembly()
        ]
        assemblies.forEach { $0.assemble(container: container) }
    }

}
