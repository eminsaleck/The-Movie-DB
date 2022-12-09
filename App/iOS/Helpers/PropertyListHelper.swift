//
//  PropertyListHelper.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

import Foundation

struct PropertyListHelper {

    static func decode<T: Decodable>(resourceName: String = "Info") -> T {
        guard let url = Bundle.main.url(forResource: resourceName, withExtension: ".plist") else {
            fatalError()
        }
        do {
            let baseParameters: T = try url.decodePropertyList()
            return baseParameters
        } catch {
            fatalError()
        }
    }

}
