//
//  MovieListProtocols.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import UIKit
import UpcomingMoviesDomain

protocol MovieListViewModelProtocol {

    var viewState: Bindable<SimpleViewState<Movie>> { get set }
    var startLoading: Bindable<Bool> { get set }

    var needsPrefetch: Bool { get }

    var displayTitle: String? { get set }
    var movieCells: [MovieListCellViewModelProtocol] { get }

    func getMovies()
    func refreshMovies()

    func selectedMovie(at index: Int) -> Movie

}

protocol MoviesInteractorProtocol {

    func getMovies(page: Int, completion: @escaping (Result<[UpcomingMoviesDomain.Movie], Error>) -> Void)

}

protocol MovieListCoordinatorProtocol: AnyObject {

    func showMovieDetail(for movie: Movie)

}
