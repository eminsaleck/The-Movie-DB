//
//  File.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 05.11.2022.
//

import Foundation

enum Genre: Codable, Hashable, CaseIterable{
    case action
    case adventure
    case animation
    case comedy
    case crime
    case documentary
    case drama
    case family
    case fantasy
    case history
    case horror
    case music
    case mystery
    case romance
    case scienceFiction
    case tvMovie
    case thriller
    case war
    case western
    
    
    var id: Int {
        switch self {
        case .action:
            return 28
        case .adventure:
            return 12
        case .animation:
            return 16
        case .comedy:
            return 35
        case .crime:
            return 80
        case .documentary:
            return 99
        case .drama:
            return 18
        case .family:
            return 10751
        case .fantasy:
            return 14
        case .history:
            return 36
        case .horror:
            return 27
        case .music:
            return 10402
        case .mystery:
            return 9648
        case .romance:
            return 10749
        case .scienceFiction:
            return 878
        case .tvMovie:
            return 10770
        case .thriller:
            return 53
        case .war:
            return 10752
        case .western:
            return 37
        }
    }
    
}

