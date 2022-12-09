//
//  Cast.swift
//  Domain
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

public struct Cast: Equatable {

    public let id: Int
    public let character: String
    public let name: String
    public let photoPath: String?

    public init(id: Int, character: String, name: String, photoPath: String?) {
        self.id = id
        self.character = character
        self.name = name
        self.photoPath = photoPath
    }

}
