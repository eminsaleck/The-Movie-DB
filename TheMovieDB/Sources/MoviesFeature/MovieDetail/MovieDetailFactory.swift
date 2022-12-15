//
//  MovieDetailFactory.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import UIKit

final class MovieDetailFactory: MovieDetailFactoryProtocol {

    var options: [MovieDetailOption] {
        return [.reviews,
                .trailers,
                .credits,
                .similarMovies]
    }

}
