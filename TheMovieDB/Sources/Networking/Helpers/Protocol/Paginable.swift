//
//  Paginable.swift
//  Networking
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//

protocol Paginable {

    var currentPage: Int { get set }
    var totalPages: Int { get set }

}

extension Paginable {

    var hasMorePages: Bool {
        return currentPage < totalPages
    }

    var nextPage: Int {
        return hasMorePages ? currentPage + 1 : currentPage
    }

}
