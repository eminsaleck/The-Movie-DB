//
//  MovieSearchLocalDataSourceProtocol.swift
//  Data
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Domain

public protocol MovieSearchLocalDataSourceProtocol {

    var didUpdateMovieSearch: (() -> Void)? { get set }

    func getMovieSearches() -> [MovieSearch]
    func save(with searchText: String)

}
