//
//  Review.swift
//  NetworkInfrastructure
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

import Domain

struct Review: Decodable {

    let id: String
    let authorName: String
    let content: String

    private enum CodingKeys: String, CodingKey {
        case id
        case authorName = "author"
        case content
    }

}

extension Review: DomainConvertible {

    func asDomain() -> Domain.Review {
        return Domain.Review(id: id, authorName: authorName, content: content)
    }

}
