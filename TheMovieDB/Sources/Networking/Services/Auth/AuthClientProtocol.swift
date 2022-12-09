//
//  AuthClientProtocol.swift
//  NetworkInfrastructure
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

protocol AuthClientProtocol {

    func getRequestToken(with readAccessToken: String,
                         completion: @escaping (Result<RequestTokenResult, APIError>) -> Void)

    func getAccessToken(with readAccessToken: String,
                        requestToken: String,
                        completion: @escaping (Result<AccessToken, APIError>) -> Void)

    func createSessionId(with accessToken: String,
                         completion: @escaping (Result<SessionResult, APIError>) -> Void)

}
