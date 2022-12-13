//
//  Dictionary+Extensions.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 10.11.2022.
//

import Foundation

extension Dictionary {

    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
            }
            .joined(separator: "&")
    }

}
