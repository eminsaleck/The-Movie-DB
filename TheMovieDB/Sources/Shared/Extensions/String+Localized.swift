//
//  String+Localized.swift
//  TheMovieDB
//
//  Created by LEMIN DAHOVICH on 10.11.2022.
//

import Foundation

extension String {

    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self,
                                 tableName: tableName,
                                 bundle: bundle,
                                 value: self,
                                 comment: "")
    }

}
