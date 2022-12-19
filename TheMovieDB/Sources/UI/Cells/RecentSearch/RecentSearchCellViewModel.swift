//
//  RecentSearchCellViewModel.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import Foundation

protocol RecentSearchCellViewModelProtocol {

    var searchText: String { get }

}

final class RecentSearchCellViewModel: RecentSearchCellViewModelProtocol {

    let searchText: String

    init(searchText: String) {
        self.searchText = searchText
    }

}
