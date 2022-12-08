//
//  MovieSearch.swift
//  Domain
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Foundation

public struct MovieSearch {

    public let id: String
    public let searchText: String
    public let createdAt: Date

    public init(id: String, searchText: String, createdAt: Date) {
        self.id = id
        self.searchText = searchText
        self.createdAt = createdAt
    }

}
