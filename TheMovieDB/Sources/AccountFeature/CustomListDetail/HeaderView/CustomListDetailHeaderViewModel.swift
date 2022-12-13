//
//  CustomListDetailHeaderViewModel.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 12.12.2022.
//


import Foundation
import Domain

protocol CustomListDetailHeaderViewModelProtocol {

    var name: String { get }
    var description: String? { get }
    var posterURL: URL? { get }

}

struct CustomListDetailHeaderViewModel: CustomListDetailHeaderViewModelProtocol {

    let name: String
    let description: String?
    let posterURL: URL?

    init(list: List) {
        self.name = list.name
        self.description = list.description
        self.posterURL = list.backdropURL
    }

}
