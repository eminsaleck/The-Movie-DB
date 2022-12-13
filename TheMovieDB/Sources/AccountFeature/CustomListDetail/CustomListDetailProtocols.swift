//
//  CustomListDetailProtocols.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 12.12.2022.
//


import Foundation
import Shared
import UI
import Domain

protocol CustomListDetailViewModelProtocol {

    var listName: String? { get }
    var viewState: Bindable<CustomListDetailViewState> { get }
    var movieCells: [MovieCellViewModel] { get }

    func buildHeaderViewModel() -> CustomListDetailHeaderViewModelProtocol
    func buildSectionViewModel() -> CustomListDetailSectionViewModel

    func movie(at index: Int) -> Movie

    func getListMovies()

}

protocol CustomListDetailInteractorProtocol {

    func getCustomListMovies(listId: String, completion: @escaping (Result<[Movie], Error>) -> Void)

}

protocol CustomListDetailCoordinatorProtocol: AnyObject {

    func showMovieDetail(for movie: Movie)

}
