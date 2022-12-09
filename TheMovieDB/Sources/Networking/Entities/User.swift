//
//  User.swift
//  NetworkInfrastructure
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

import Domain

 struct User: Decodable {

    let id: Int
    let name: String
    let username: String
    let includeAdult: Bool

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case username
        case includeAdult = "include_adult"
    }

}

extension User: DomainConvertible {

    func asDomain() -> Domain.User {
        return Domain.User(id: id, name: name,
                                         username: username, includeAdult: includeAdult)
    }

}
