//
//  Video.swift
//  NetworkInfrastructure
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

import Domain

struct Video: Decodable {

    let id: String
    let key: String
    let name: String
    let site: String

}

extension Video {

    var browserURL: URL? {
        return URL(string: "https://www.youtube.com/watch?v=\(key)")
    }

    var deepLinkURL: URL? {
        return URL(string: "youtube://\(key)")
    }

    var thumbnailURL: URL? {
        return URL(string: "https://img.youtube.com/vi/\(key)/mqdefault.jpg")
    }

}

extension Video: DomainConvertible {

    func asDomain() -> Domain.Video {
        return Domain.Video(id: id, key: key, name: name, site: site,
                                          browserURL: browserURL, deepLinkURL: deepLinkURL, thumbnailURL: thumbnailURL)
    }

}
