//
//  Displayable.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 08.11.2022.
//

import Foundation


protocol Displayable {
    var poster: String { get }
    var review: String { get }
    var titleName: String { get }
    var rating: Double { get }
    var idTrailer: Int { get }
    var vote: Double { get }
}
