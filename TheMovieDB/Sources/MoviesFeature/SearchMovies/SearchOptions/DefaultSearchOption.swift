//
//  DefaultSearchOption.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import UIKit

enum DefaultSearchOption {
    case popular, topRated

    var title: String? {
        switch self {
        case .popular:
            return "Popular movies"
        case .topRated:
            return "Top rated movies"
        }
    }

    var subtitle: String? {
        switch self {
        case .popular:
            return "The hottest movies on the internet"
        case .topRated:
            return "The top rated movies on the internet"
        }
    }

    var icon: UIImage {
        switch self {
        case .popular:
            return #imageLiteral(resourceName: "Popular")
        case .topRated:
            return #imageLiteral(resourceName: "TopRated")
        }
    }

}
