//
//  Video.swift
//  Domain
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Foundation

public struct Video {

    public let id: String
    public let key: String
    public let name: String
    public let site: String
    public let browserURL: URL?
    public let deepLinkURL: URL?
    public let thumbnailURL: URL?

    public init(id: String, key: String, name: String, site: String,
                browserURL: URL?, deepLinkURL: URL?, thumbnailURL: URL?) {
        self.id = id
        self.key = key
        self.name = name
        self.site = site
        self.browserURL = browserURL
        self.deepLinkURL = deepLinkURL
        self.thumbnailURL = thumbnailURL
    }

}

extension Video: Equatable {

    public static func == (lhs: Video, rhs: Video) -> Bool {
        return lhs.id == rhs.id
    }

}
