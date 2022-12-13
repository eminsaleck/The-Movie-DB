//
//  ConfigurationHandler.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 13.11.2022.
//

import Foundation
import Domain

final class ConfigurationHandler: ConfigurationHandlerProtocol {

    private var imageConfiguration: ImageConfigurationHandler?

    // MARK: - ConfigurationHandlerProtocol

    var regularImageBaseURLString: String {
        guard !isTesting() else {
            return ImageConfigurationHandler.Constants.defaultRegularImageBaseURLString
        }
        return imageConfiguration?.regularImageBaseURLString ?? ImageConfigurationHandler.Constants.defaultRegularImageBaseURLString
    }

    var backdropImageBaseURLString: String {
        guard !isTesting() else {
            return ImageConfigurationHandler.Constants.defaultBackdropImageBaseURLString
        }
        return imageConfiguration?.backdropImageBaseURLString ??  ImageConfigurationHandler.Constants.defaultBackdropImageBaseURLString
    }

    func setConfiguration(_ configuration: Configuration) {
        self.imageConfiguration = ImageConfigurationHandler(configuration: configuration)
    }

    // MARK: - XCTest

    private func isTesting() -> Bool {
        return NSClassFromString("XCTest") != nil
    }

}
