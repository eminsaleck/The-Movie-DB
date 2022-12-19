//
//  Result+Optional.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 10.11.2022.
//

import Foundation

public extension Result {

    func getWrappedValue() -> Success? {
        return try? get()
    }

}
