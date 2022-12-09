//
//  ImagesConfiguration.swift
//  Domain
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

public struct ImagesConfiguration {

    public private(set) var baseURLString: String
    public private(set) var backdropSizes: [String]
    public private(set) var posterSizes: [String]

    public init(baseURLString: String, backdropSizes: [String], posterSizes: [String]) {
        self.baseURLString = baseURLString
        self.backdropSizes = backdropSizes
        self.posterSizes = posterSizes
    }

}
