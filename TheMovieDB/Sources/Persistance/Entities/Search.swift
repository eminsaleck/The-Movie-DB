//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Foundation

public struct Search {
    
    public let query: String
    public let date: Date
    
    public init(query: String, date: Date) {
        self.query = query
        self.date = date
    }
}
