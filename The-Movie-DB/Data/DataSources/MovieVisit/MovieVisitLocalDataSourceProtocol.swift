//
//  MovieVisitLocalDataSourceProtocol.swift
//  Data
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Domain

public protocol MovieVisitLocalDataSourceProtocol {

    var didUpdateMovieVisit: (() -> Void)? { get set }

    func getMovieVisits(completion: @escaping (Result<[MovieVisit], Error>) -> Void)

    func save(with id: Int, title: String, posterPath: String?,
              completion: @escaping (Result<Void, Error>) -> Void)

}
