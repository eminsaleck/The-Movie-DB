//
//  MovieReviewDetailViewModel.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import Domain

struct MovieReviewDetailViewModel: MovieReviewDetailViewModelProtocol {

    let author: String
    let content: String

    init(review: Review) {
        self.author = review.authorName
        self.content = review.content
    }

}
