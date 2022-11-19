//
//  MarkAsFavouriteResult.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

struct MarkAsFavouriteResult: Decodable {

    let statusCode: Int
    let statusMessage: String

    private enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }

}
