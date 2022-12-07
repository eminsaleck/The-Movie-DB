//
//  SortConfiguration.swift
//  Domain
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

public struct SortConfiguration {

    public private(set) var movieSortKeys: [String]

    public init(movieSortKeys: [String]) {
        self.movieSortKeys = movieSortKeys
    }

}
