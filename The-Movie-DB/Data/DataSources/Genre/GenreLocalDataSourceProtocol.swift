//
//  GenreLocalDataSourceProtocol.swift
//  Data
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Domain

public protocol GenreLocalDataSourceProtocol {

    var didUpdateGenre: (() -> Void)? { get set }

    func saveGenres(_ genres: [Genre])
    func find(with id: Int) -> Genre?
    func findAll() -> [Genre]

}
