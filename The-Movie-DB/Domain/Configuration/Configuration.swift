//
//  Configuration.swift
//  Domain
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

public struct Configuration {

    public private(set) var imagesConfiguration: ImagesConfiguration
    public private(set) var sortConfiguration: SortConfiguration

    public init(imagesConfiguration: ImagesConfiguration, sortConfiguration: SortConfiguration) {
        self.imagesConfiguration = imagesConfiguration
        self.sortConfiguration = sortConfiguration
    }

}
