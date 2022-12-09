//
//  BaseConfig.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Foundation

struct BaseConfig: Decodable {

    struct Keys: Decodable {

        let readAccessToken: String
        let apiKey: String

        private enum CodingKeys: String, CodingKey {
            case readAccessToken = "ReadAccessToken"
            case apiKey = "ApiKey"
        }

    }

    let keys: Keys

    private enum CodingKeys: String, CodingKey {
        case keys = "TMDB"
    }

}
