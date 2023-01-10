//
//  AppExtension.swift
//  TheMovieDB
//
//  Created by LEMIN DAHOVICH on 13.11.2022.
//

import Foundation

struct AppExtension {

    static let scheme = "extension"

    enum Host: String {

        case upcomingMovies = "upcoming"
        case searchMovies = "search"

    }

    static func url(for host: AppExtension.Host) -> URL? {
        let urlString = scheme + "://" + host.rawValue
        return URL(string: urlString)
    }

}
