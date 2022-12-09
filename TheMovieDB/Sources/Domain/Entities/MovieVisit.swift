//
//  MovieVisit.swift
//  Domain
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Foundation

public struct MovieVisit {

    public let id: Int
    public let title: String
    public let posterPath: String
    public let createdAt: Date?

    public init(id: Int, title: String, posterPath: String, createdAt: Date?) {
        self.id = id
        self.title = title
        self.posterPath = posterPath
        self.createdAt = createdAt
    }

}
