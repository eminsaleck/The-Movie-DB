//
//  MovieReviewsProtocols.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import UIKit
import Domain
import Common
import UI

protocol MovieReviewsViewModelProtocol {

    var movieTitle: String { get set }

    var viewState: Bindable<SimpleViewState<Review>> { get }
    var startLoading: Bindable<Bool> { get }

    var reviewCells: [MovieReviewCellViewModelProtocol] { get }
    var needsPrefetch: Bool { get }

    func selectedReview(at index: Int) -> Review

    func getMovieReviews()
    func refreshMovieReviews()

}

protocol MovieReviewsInteractorProtocol {

    func getMovieReviews(for movieId: Int, page: Int?,
                         completion: @escaping (Result<[Review], Error>) -> Void)

}

protocol MovieReviewsCoordinatorProtocol: AnyObject {

    func showReviewDetail(for review: Review, transitionView: UIView?)

}
