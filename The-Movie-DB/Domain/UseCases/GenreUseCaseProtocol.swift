//
//  GenreUseCaseProtocol.swift
//  Domain
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

public protocol GenreUseCaseProtocol {

    var didUpdateGenre: (() -> Void)? { get set }

    func find(with id: Int, completion: @escaping (Result<Genre?, Error>) -> Void)
    func fetchAll(completion: @escaping (Result<[Genre], Error>) -> Void)

}
