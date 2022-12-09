//
//  MovieSearchProtocol.swift
//  Domain
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

public protocol MovieSearchUseCaseProtocol {

    var didUpdateMovieSearch: (() -> Void)? { get set }

    func getMovieSearches() -> [MovieSearch]
    func save(with searchText: String)

}
