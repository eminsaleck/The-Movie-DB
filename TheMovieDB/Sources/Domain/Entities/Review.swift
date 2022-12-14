//
//  Review.swift
//  Domain
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

public struct Review: Equatable {

    public let id: String
    public let authorName: String
    public let content: String

    public init(id: String, authorName: String, content: String) {
        self.id = id
        self.authorName = authorName
        self.content = content
    }

}
