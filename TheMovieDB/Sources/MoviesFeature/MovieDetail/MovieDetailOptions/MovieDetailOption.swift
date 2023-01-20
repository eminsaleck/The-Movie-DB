//
//  MovieDetailOption.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import Common

enum MovieDetailOption {

    case trailers, reviews, credits, similarMovies

    var title: String {
        switch self {
        case .trailers:
            return LocalizedStrings.trailersDetailOptions()
        case .reviews:
            return LocalizedStrings.reviewsDetailOptions()
        case .credits:
            return LocalizedStrings.creditsDetailOptions()
        case .similarMovies:
            return LocalizedStrings.similarsDetailOptions()
        }
    }

    var iconName: String {
        switch self {
        case .trailers:
            return "PlayVideo"
        case .reviews:
            return "Reviews"
        case .credits:
            return "Cast"
        case .similarMovies:
            return "SimilarMovies"
        }
    }

}
