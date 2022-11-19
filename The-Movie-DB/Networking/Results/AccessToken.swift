//
//  AccessToken.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//


struct AccessToken: Decodable {

    let token: String
    let accountId: String

    private enum CodingKeys: String, CodingKey {
        case token = "access_token"
        case accountId = "account_id"
    }

}

