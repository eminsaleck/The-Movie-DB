//
//  Account.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Foundation

enum AccountProvider {
    
    case getAccountDetail(sessionId: String)
    case getFavoriteList(page: Int, sessionId: String, accountId: Int)
    case markAsFavorite(sessionId: String, accountId: Int, movieId: Int, favorite: Bool)
}

extension AccountProvider: Endpoint {
    
    var base: String {
        return NetworkConfiguration.shared.baseAPIURLString
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAccountDetail, .getFavoriteList:
            return .get
        case .markAsFavorite:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .getAccountDetail:
            return "/3/account"
        case .getFavoriteList(_, _, let accountId):
            return "/3/account/\(accountId)/favorite/movies"
        case .markAsFavorite(_, let accountId, _, _):
            return "/3/account/\(accountId)/favorite"
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getAccountDetail, .getFavoriteList, .markAsFavorite:
            return nil
        }
    }
    
    var params: [String: Any]? {
        switch self {
        case .getAccountDetail(let sessionId):
            return ["session_id": sessionId]
        case .getFavoriteList(let page, let sessionId, _):
            return ["session_id": sessionId, "page": page]
        case .markAsFavorite(let sessionId, _, let movieId, let favorite):
            let queryParams: [String: Any] = ["session_id": sessionId]
            let bodyParams: [String: Any] = ["media_type": "movie",
                                             "media_id": movieId,
                                             "favorite": favorite]
            return ["query": queryParams, "body": bodyParams]
        }
    }
    
    var encoding: EncondingParam {
        switch self {
        case .getAccountDetail, .getFavoriteList:
            return .defaultEncoding
        case .markAsFavorite:
            return .compositeEncoding
        }
    }
    
}

