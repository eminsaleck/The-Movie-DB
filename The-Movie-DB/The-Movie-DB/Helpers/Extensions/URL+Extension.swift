//
//  URL+Extension.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Foundation

extension URL {

    func decodePropertyList<T: Decodable>() throws -> T {
        let data = try Data(contentsOf: self)
        let decoder = PropertyListDecoder()
        return try decoder.decode(T.self, from: data)
    }

}
