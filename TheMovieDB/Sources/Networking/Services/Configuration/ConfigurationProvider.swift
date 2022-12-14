//
//  ConfigurationProvider.swift
//  NetworkInfrastructure
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//
enum ConfigurationProvider {

    case getAPIConfiguration

}

// MARK: - Endpoint

extension ConfigurationProvider: Endpoint {

    var base: String {
        return NetworkConfiguration.shared.baseAPIURLString
    }

    var path: String {
        switch self {
        case .getAPIConfiguration:
            return "/3/configuration"
        }
    }

    var headers: [String: String]? {
        switch self {
        case .getAPIConfiguration:
            return nil
        }
    }

    var params: [String: Any]? {
        switch self {
        case .getAPIConfiguration:
            return nil
        }
    }

    var parameterEncoding: ParameterEnconding {
        switch self {
        case .getAPIConfiguration:
            return .defaultEncoding
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getAPIConfiguration:
            return .get
        }
    }

}
