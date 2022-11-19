//
//  AuthProvider.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Foundation

enum AuthProvider {

    case getRequestToken(readAccessToken: String)
    case getAccessToken(readAccessToken: String, requestToken: String)
    case createSessionId(accessToken: String)

}

extension AuthProvider: Endpoint {

    var base: String {
        return NetworkConfiguration.shared.baseAPIURLString
    }

    var path: String {
        switch self {
        case .getRequestToken:
            return "/4/auth/request_token"
        case .getAccessToken:
            return "/4/auth/access_token"
        case .createSessionId:
            return "/3/authentication/session/convert/4"
        }
    }

    var headers: [String: String]? {
        switch self {
        case .getRequestToken(let readAccessToken):
            return ["Authorization": "Bearer \(readAccessToken)"]
        case .getAccessToken(let readAccessToken, _):
            return ["Authorization": "Bearer \(readAccessToken)"]
        case .createSessionId:
            return nil
        }
    }

    var params: [String: Any]? {
        switch self {
        case .getRequestToken:
            return nil
        case .getAccessToken(_, let requestToken):
            return ["request_token": requestToken]
        case .createSessionId(let accessToken):
            return ["access_token": accessToken]
        }
    }

    var encoding: EncondingParam {
        switch self {
        case .getRequestToken:
            return .defaultEncoding
        case .getAccessToken, .createSessionId:
            return .jsonEncoding
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getRequestToken, .getAccessToken, .createSessionId:
            return .post
        }
    }

}
