//
//  Cast.swift
//  NetworkInfrastructure
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

import Domain

struct Cast: Decodable {

    let id: Int
    let character: String
    let name: String
    let photoPath: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case character
        case name
        case photoPath = "profile_path"
    }

}

extension Cast: DomainConvertible {

    func asDomain() -> Domain.Cast {
        return Domain.Cast(id: id, character: character, name: name, photoPath: photoPath)
    }

}
