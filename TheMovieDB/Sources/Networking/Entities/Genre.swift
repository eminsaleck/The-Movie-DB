//
//  Genre.swift
//  NetworkInfrastructure
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

import Domain

struct Genre: Decodable {

    let id: Int
    let name: String

}

extension Genre: DomainConvertible {

    func asDomain() -> Domain.Genre {
        return Domain.Genre(id: id, name: name)
    }

}
