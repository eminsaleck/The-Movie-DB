//
//  Crew.swift
//  Domain
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

public struct Crew: Equatable {

    public let id: Int
    public let job: String
    public let name: String
    public let photoPath: String?

    public init(id: Int, job: String, name: String, photoPath: String?) {
        self.id = id
        self.job = job
        self.name = name
        self.photoPath = photoPath
    }

}
