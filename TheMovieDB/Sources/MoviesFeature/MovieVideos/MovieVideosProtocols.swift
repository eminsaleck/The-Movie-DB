//
//  MovieVideosProtocols.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import Foundation
import Domain
import UI
import Common

protocol MovieVideosViewModelProtocol {

    var movieTitle: String { get }

    var viewState: Bindable<SimpleViewState<Video>> { get }
    var startLoading: Bindable<Bool> { get }

    var videoCells: [MovieVideoCellViewModelProtocol] { get }

    func videoURL(at index: Int) -> URL?
    func getMovieVideos(showLoader: Bool)

}

protocol MovieVideosInteractorProtocol {

    func getMovieVideos(for movieId: Int, page: Int?,
                        completion: @escaping (Result<[Video], Error>) -> Void)

}

protocol MovieVideosCoordinatorProtocol: AnyObject {}
