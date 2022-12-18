//
//  Entities+ImageConfiguration.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 10.11.2022.
//

import Foundation
import Domain

public protocol ImageConfigurable {

    public var regularImageBaseURLString: String { get }
    public var backdropImageBaseURLString: String { get }
}

public extension ImageConfigurable {

    public var configurationHandler: ConfigurationHandlerProtocol {
        DIContainer.shared.resolve()
    }

    public var regularImageBaseURLString: String {
        configurationHandler.regularImageBaseURLString
    }

    public var backdropImageBaseURLString: String {
        configurationHandler.backdropImageBaseURLString
    }

}

public extension Movie: ImageConfigurable {

    public var posterURL: URL? {
        guard let posterPath = posterPath else { return nil }
        let urlString = regularImageBaseURLString.appending(posterPath)
        return URL(string: urlString)
    }

    public var backdropURL: URL? {
        guard let backdropPath = backdropPath else { return nil }
        let urlString = backdropImageBaseURLString.appending(backdropPath)
        return URL(string: urlString)
    }

}

public extension Cast: ImageConfigurable {

    public var profileURL: URL? {
        guard let photoPath = photoPath else { return nil }
        let urlString = regularImageBaseURLString.appending(photoPath)
        return URL(string: urlString)
    }

}

public extension Crew: ImageConfigurable {

    public var profileURL: URL? {
        guard let photoPath = photoPath else { return nil }
        let urlString = regularImageBaseURLString.appending(photoPath)
        return URL(string: urlString)
    }

}

public extension List: ImageConfigurable {

    public var backdropURL: URL? {
        guard let backdropPath = backdropPath else { return nil }
        let urlString = backdropImageBaseURLString.appending(backdropPath)
        return URL(string: urlString)
    }

}
