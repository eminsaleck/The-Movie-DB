//
//  ImageConfigurationHandler.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 13.11.2022.
//

import Domain

struct ImageConfigurationHandler {

    private let configuration: Configuration

    init(configuration: Configuration) {
        self.configuration = configuration
    }

    private var baseURLString: String {
        return configuration.imagesConfiguration.baseURLString
    }

    var regularImageBaseURLString: String {
        let posterSize = configuration.imagesConfiguration.posterSizes.mid ?? Constants.defaultRegularSize
        return baseURLString + posterSize
    }

    var backdropImageBaseURLString: String {
        let backdropSize = configuration.imagesConfiguration.backdropSizes.mid ?? Constants.defaultBackdropSize
        return baseURLString + backdropSize
    }

}

// MARK: - Constants

extension ImageConfigurationHandler {

    struct Constants {

        static let defaultRegularSize = "w185"
        static let defaultBackdropSize = "w500"

        static let defaultRegularImageBaseURLString: String = "https://image.tmdb.org/t/p/w185"
        static let defaultBackdropImageBaseURLString: String = "https://image.tmdb.org/t/p/w500"
    }

}
