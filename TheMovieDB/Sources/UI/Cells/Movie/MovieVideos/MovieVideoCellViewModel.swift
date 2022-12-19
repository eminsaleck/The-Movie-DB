//
//  MovieVideoCellViewModel.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import Foundation
import Domain

protocol MovieVideoCellViewModelProtocol {

    var name: String { get }
    var key: String { get }
    var thumbnailURL: URL? { get }

}

final class MovieVideoCellViewModel: MovieVideoCellViewModelProtocol {

    let name: String
    let key: String
    let thumbnailURL: URL?

    init(_ video: Video) {
        name = video.name
        key = video.key
        thumbnailURL = video.thumbnailURL
    }

}
