//
//  AppGroup.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 13.11.2022.
//

enum AppGroup: String, CaseIterable {

    case movies = "group.movies.extension"

    static var allCasesIdentifiers: [String] {
        return AppGroup.allCases.map { $0.rawValue }
    }

}
