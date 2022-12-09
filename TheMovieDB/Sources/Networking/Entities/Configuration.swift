//
//  Configuration.swift
//  NetworkInfrastructure
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

import Domain

struct ImagesConfiguration: Decodable {

    let baseURLString: String
    let backdropSizes: [String]
    let posterSizes: [String]

    private enum CodingKeys: String, CodingKey {
        case baseURLString = "secure_base_url"
        case backdropSizes = "backdrop_sizes"
        case posterSizes = "poster_sizes"
    }

}

struct ImagesConfigurationResult: Decodable {

    let result: ImagesConfiguration

    private enum CodingKeys: String, CodingKey {
        case result = "images"
    }

}

struct SortConfigurationResult {

    let movieSortKeys: [String]

}

struct Configuration {

    let imagesConfiguration: ImagesConfigurationResult
    let sortConfiguration: SortConfigurationResult

    var baseURLString: String {
        return imagesConfiguration.result.baseURLString
    }

    var backdropSizes: [String] {
        return imagesConfiguration.result.backdropSizes
    }

    var posterSizes: [String] {
        return imagesConfiguration.result.posterSizes
    }

    var movieSortKeys: [String] {
        return sortConfiguration.movieSortKeys
    }

}

extension Configuration: DomainConvertible {

    func asDomain() -> Domain.Configuration {
        let imagesConfiguration = Domain.ImagesConfiguration(baseURLString: baseURLString,
                                                                           backdropSizes: backdropSizes,
                                                                           posterSizes: posterSizes)
        let sortConfiguration = Domain.SortConfiguration(movieSortKeys: movieSortKeys)

        return Domain.Configuration(imagesConfiguration: imagesConfiguration,
                                                  sortConfiguration: sortConfiguration)
    }

}
