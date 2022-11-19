//
//  User.swift
//  UseCases
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Foundation

public struct User: Equatable {

    public let id: Int
    public let name: String
    public let username: String
    public let includeAdult: Bool

    public init(id: Int, name: String, username: String, includeAdult: Bool) {
        self.id = id
        self.name = name
        self.username = username
        self.includeAdult = includeAdult
    }

}
