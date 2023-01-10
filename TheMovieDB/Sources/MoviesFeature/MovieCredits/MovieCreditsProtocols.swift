//
//  MovieCreditsProtocols.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import Foundation
import Domain
import UI

protocol MovieCreditsViewModelProtocol {

    var movieTitle: String { get }

    var viewState: Bindable<MovieCreditsViewState> { get }
    var didToggleSection: Bindable<Int> { get }
    var startLoading: Bindable<Bool> { get }

    func numberOfSections() -> Int
    func numberOfItems(for section: Int) -> Int

    func creditModel(for section: Int, and index: Int) -> MovieCreditCellViewModelProtocol
    func headerModel(for index: Int) -> CollapsibleHeaderViewModel

    func toggleSection(_ section: Int)
    func getMovieCredits(showLoader: Bool)

}

protocol MovieCreditsInteractorProtocol {

    func getMovieCredits(for movieId: Int, page: Int?,
                         completion: @escaping (Result<MovieCredits, Error>) -> Void)

}

protocol MovieCreditsFactoryProtocol {

    var sections: [MovieCreditsCollapsibleSection] { get set }

}

protocol MovieCreditsCoordinatorProtocol: AnyObject {}
