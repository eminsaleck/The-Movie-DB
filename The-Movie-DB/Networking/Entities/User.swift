//
//  User.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import UseCases

struct User: Decodable {

   let id: Int
   let name: String
   let username: String
   let includeAdult: Bool

   private enum CodingKeys: String, CodingKey {
       case id
       case name
       case username
       case includeAdult = "include_adult"
   }
}

extension User: UseCasesConvertible {
   func asDomain() -> UseCases.User {
       return UseCases.User(id: id, name: name,
                                        username: username, includeAdult: includeAdult)
   }
}
