//
//  MovieCreditsFactory.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import Foundation

final class MovieCreditsFactory: MovieCreditsFactoryProtocol {

    var sections = [MovieCreditsCollapsibleSection(type: .cast, opened: true),
                    MovieCreditsCollapsibleSection(type: .crew, opened: false)]

}
