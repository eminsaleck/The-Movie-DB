//
//  AuthenticationManagerProtocol.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import UseCases

protocol AuthenticationManagerProtocol {

    var readAccessToken: String { get }

    func saveCurrentUser(_ sessionId: String, accountId: Int)
    func deleteCurrentUser()

    func saveRequestToken(_ requestToken: String)
    var requestToken: String? { get }

    func saveAccessToken(_ accessToken: AccessToken)
    var accessToken: AccessToken? { get }

    var userAccount: Account? { get }

}

