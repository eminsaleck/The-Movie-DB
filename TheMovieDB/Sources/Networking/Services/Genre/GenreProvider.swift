//
//  GenreProvider.swift
//  NetworkInfrastructure
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

enum GenreProvider {

    case getAll

}

// MARK: - Endpoint

extension GenreProvider: Endpoint {

    var base: String {
        return NetworkConfiguration.shared.baseAPIURLString
    }

    var path: String {
        switch self {
        case .getAll:
            return "/3/genre/movie/list"
        }
    }

    var headers: [String: String]? {
        return nil
    }

    var params: [String: Any]? {
        switch self {
        case .getAll:
            return nil
        }
    }

    var parameterEncoding: ParameterEnconding {
        return .defaultEncoding
    }

    var method: HTTPMethod {
        switch self {
        case .getAll:
            return .get
        }
    }

}
