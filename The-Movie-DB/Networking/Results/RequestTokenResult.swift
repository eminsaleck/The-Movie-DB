//
//  RequestTokenResult.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

struct RequestTokenResult: Decodable {

    let success: Bool
    let token: String

    private enum CodingKeys: String, CodingKey {
        case success
        case token = "request_token"
    }

}
