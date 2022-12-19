//
//  MovieReviewCellViewModel.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import Foundation
import Domain

protocol MovieReviewCellViewModelProtocol {

    var authorName: String { get }
    var content: String { get }

}

final class MovieReviewCellViewModel: MovieReviewCellViewModelProtocol {

    let authorName: String
    let content: String

    init(_ review: Review) {
        self.authorName = review.authorName
        self.content = review.content
    }

}
