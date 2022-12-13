//
//  Array+MidElement.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 10.11.2022.
//

extension Array {

    var mid: Element? {
        guard count != 0 else { return nil }

        let midIndex = (count > 1 ? count - 1 : count) / 2
        return self[midIndex]
    }

}
