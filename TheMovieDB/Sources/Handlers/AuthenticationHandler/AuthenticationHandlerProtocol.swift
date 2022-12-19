//
//  AuthenticationHandlerProtocol.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 13.11.2022.
//

import Domain

public protocol AuthenticationHandlerProtocol {

    func currentUser() -> User?
    func isUserSignedIn() -> Bool
    func deleteCurrentUser()

}
