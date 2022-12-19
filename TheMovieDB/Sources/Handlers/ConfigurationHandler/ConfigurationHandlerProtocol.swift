//
//  ConfigurationHandlerProtocol.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 13.11.2022.
//

import Domain

public protocol ConfigurationHandlerProtocol {

    var regularImageBaseURLString: String { get }
    var backdropImageBaseURLString: String { get }

    func setConfiguration(_ configuration: Configuration)

}
