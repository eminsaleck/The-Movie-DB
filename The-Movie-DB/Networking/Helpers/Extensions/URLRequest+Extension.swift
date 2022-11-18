//
//  URLRequest+Extension.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 18.11.2022.
//

import Foundation

extension URLRequest {

    mutating func setJSONContentType() {
        setValue("application/json; charset=utf-8",
                 forHTTPHeaderField: "Content-Type")
    }

    mutating func setHeader(for httpHeaderField: String, with value: String) {
        setValue(value, forHTTPHeaderField: httpHeaderField)
    }

}
