//
//  AccessToken.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 09.12.2022.
//

public struct AccessToken: Decodable {

    public let token: String
    public let accountId: String

    public init(token: String, accountId: String) {
      self.token = token
      self.accountId = accountId
    }
    
    private enum CodingKeys: String, CodingKey {
        case token = "access_token"
        case accountId = "account_id"
    }

}
