//
//  BaseConfiguration.swift
//  TheMovieDB
//
//  Created by LEMIN DAHOVICH on 13.11.2022.
//

struct BaseConfiguration: Decodable {

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
        case keys = "TheMovieDb"
    }

}
