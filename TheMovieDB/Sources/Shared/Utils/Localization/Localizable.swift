//
//  Localizable.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 13.11.2022.
//

protocol Localizable {

    var tableName: String { get }
    var localized: String { get }

}

extension Localizable where Self: RawRepresentable, Self.RawValue == String {

    var tableName: String {
        return "Localizable"
    }

    var localized: String {
        return rawValue.localized(tableName: tableName)
    }

    func callAsFunction() -> String {
        return self.localized
    }

}
