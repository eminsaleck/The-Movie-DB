//
//  Crew.swift
//  NetworkInfrastructure
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

import Domain

struct Crew: Decodable {

    let id: Int
    let job: String
    let name: String
    let photoPath: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case job
        case name
        case photoPath = "profile_path"
    }

}

extension Crew: DomainConvertible {

    func asDomain() -> Domain.Crew {
        return Domain.Crew(id: id, job: job, name: name, photoPath: photoPath)
    }

}
