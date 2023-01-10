//
//  Entities+ImageConfiguration.swift
//  TheMovieDB
//
//  Created by LEMIN DAHOVICH on 10.11.2022.
//

import Foundation
import Domain

public protocol ImageConfigurable {

     var regularImageBaseURLString: String { get }
     var backdropImageBaseURLString: String { get }
}

public extension ImageConfigurable {

     var configurationHandler: ConfigurationHandlerProtocol {
        DIContainer.shared.resolve()
    }

     var regularImageBaseURLString: String {
        configurationHandler.regularImageBaseURLString
    }

     var backdropImageBaseURLString: String {
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
