//
//  CustomListDetailViewModel.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 12.12.2022.
//


import Foundation
import Domain
import Common
import UI

public final class CustomListDetailViewModel: CustomListDetailViewModelProtocol {

    // MARK: - Dependencies

    private let list: List
    private let interactor: CustomListDetailInteractorProtocol

    // MARK: - Reactive properties

    private(set) public var viewState: Bindable<CustomListDetailViewState> = Bindable(.loading)

    // MARK: - Computed properties

    private var movies: [Movie] {
        return viewState.value.currentMovies
    }

    public var movieCells: [MovieCellViewModel] {
        return movies.map { MovieCellViewModel($0) }
    }

    public var listName: String? {
        return self.list.name
    }

    // MARK: - Initializers

    public init(_ list: List, interactor: CustomListDetailInteractorProtocol) {
        self.list = list
        self.interactor = interactor
    }

    // MARK: - CustomListDetailViewModelProtocol

    public func buildHeaderViewModel() -> CustomListDetailHeaderViewModelProtocol {
        return CustomListDetailHeaderViewModel(list: list)
    }

    public func buildSectionViewModel() -> CustomListDetailSectionViewModel {
        return CustomListDetailSectionViewModel(list: list)
    }

    public func movie(at index: Int) -> Movie {
        return movies[index]
    }

    public func getListMovies() {
        interactor.getCustomListMovies(listId: list.id, completion: { result in
            switch result {
            case .success(let movies):
                self.viewState.value = self.processResult(movies)
            case .failure(let error):
                self.viewState.value = .error(error)
            }
        })
    }

    // MARK: - Private

    private func processResult(_ movies: [Movie]) -> CustomListDetailViewState {
        guard !movies.isEmpty else { return .empty }

        return .populated(movies)
    }

}
