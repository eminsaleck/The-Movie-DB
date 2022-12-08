//
//  Genre.swift
//  Domain
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

public struct Genre: Equatable {

    public let id: Int
    public let name: String

    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }

}
