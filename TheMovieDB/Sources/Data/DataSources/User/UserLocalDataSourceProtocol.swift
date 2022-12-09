//
//  UserLocalDataSourceProtocol.swift
//  Data
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Domain

public protocol UserLocalDataSourceProtocol {

    var didUpdateUser: (() -> Void)? { get set }

    func find(with id: Int) -> User?
    func saveUser(_ user: User)

}
