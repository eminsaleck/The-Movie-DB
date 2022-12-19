//
//  CustomListCellViewModel.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import Foundation
import Domain

protocol CustomListCellViewModelProtocol {

    var name: String { get }
    var description: String? { get }
    var movieCount: Int { get }

}

final class CustomListCellViewModel: CustomListCellViewModelProtocol {

    let name: String
    let description: String?
    let movieCount: Int

    init(_ list: List) {
        self.name = list.name
        self.description = list.description
        self.movieCount = list.movieCount
    }

}
