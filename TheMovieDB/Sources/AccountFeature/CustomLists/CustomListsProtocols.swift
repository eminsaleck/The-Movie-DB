//
//  CustomListsProtocols.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 12.12.2022.
//


import Foundation
import Domain
import Common
import UI

protocol CustomListsViewModelProtocol {

    var startLoading: Bindable<Bool> { get }
    var viewState: Bindable<SimpleViewState<List>> { get }

    var lists: [List] { get }
    var listCells: [CustomListCellViewModelProtocol] { get }

    func list(at index: Int) -> List

    func getCustomLists()
    func refreshCustomLists()

}

protocol CustomListsInteractorProtocol {

    func getCustomLists(page: Int?, completion: @escaping (Result<[List], Error>) -> Void)

}

protocol CustomListsCoordinatorProtocol: Coordinator {

    func showListDetail(for customList: List)

}
