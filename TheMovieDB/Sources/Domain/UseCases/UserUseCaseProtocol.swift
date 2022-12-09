//
//  UserUseCaseProtocol.swift
//  Domain
//
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

public protocol UserUseCaseProtocol {

    var didUpdateUser: (() -> Void)? { get set }

    func find(with id: Int) -> User?
    func saveUser(_ user: User)

}
