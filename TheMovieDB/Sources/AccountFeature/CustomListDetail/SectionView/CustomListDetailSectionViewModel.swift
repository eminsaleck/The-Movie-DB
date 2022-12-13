//
//  CustomListDetailSectionViewModel.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 12.12.2022.
//


import Foundation
import Domain

protocol CustomListDetailSectionViewModelProtocol {

    var movieCountText: String { get }
    var ratingText: String { get }
    var runtimeText: String { get }

}

final class CustomListDetailSectionViewModel: CustomListDetailSectionViewModelProtocol {

    let movieCountText: String
    var ratingText: String = "-"
    var runtimeText: String = "-"

    init(list: List) {
        movieCountText = "\(list.movieCount)"
        if let rating = list.averageRating { ratingText = "\(rating)" }
        if let runtime = list.runtime { runtimeText = getRuntimeText(for: runtime) }
    }

    func getRuntimeText(for runtime: Int) -> String {
        let hours = runtime / 60
        let minutes = runtime % 60
        return "\(hours)h \(minutes)m"
    }

}
