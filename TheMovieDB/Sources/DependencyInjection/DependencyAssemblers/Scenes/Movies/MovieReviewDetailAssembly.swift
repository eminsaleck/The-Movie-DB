//
//  MovieReviewDetailAssembly.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 17.12.2022.
//

import Foundation
import Swinject
import Domain

final class MovieReviewDetailAssembly: Assembly {

    func assemble(container: Container) {
        container.register(MovieReviewDetailViewModelProtocol.self) { (_, review: Review) in
            MovieReviewDetailViewModel(review: review)
        }
    }

}
