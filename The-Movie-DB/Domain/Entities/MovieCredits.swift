//
//  MovieCredits.swift
//  Domain
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//


public struct MovieCredits {

    public let cast: [Cast]
    public let crew: [Crew]

    public init(cast: [Cast], crew: [Crew]) {
        self.cast = cast
        self.crew = crew
    }

}
