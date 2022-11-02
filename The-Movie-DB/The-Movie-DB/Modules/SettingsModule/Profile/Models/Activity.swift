//
//  Activity.swift
//  TabBarApp
//
//  Created by Greg Delgado on 10/2/19.
//  Copyright © 2019 greg. All rights reserved.
//

import Foundation

enum ActivityType: CaseIterable {
    
    case registered
    case updatedProfile
    case updatedProfilePicture
    case addedProduct
    case addedGenre
    case likedPhoto(name: String)
    case markedEventFavorite
    case markedPromoFavorite
    
    var activityTitle: String {
        switch self {
        case .registered: return "Registered"
        case .updatedProfile: return "Updated Profile"
        case .updatedProfilePicture: return "Updated Profile Picture"
        case .addedProduct: return "Added Product"
        case .addedGenre: return "Added Genre"
        case .likedPhoto(let name): return "Liked \(name)'s photo"
        case .markedEventFavorite: return "Marked Event as Favorite"
        case .markedPromoFavorite: return "Marked Photo as Favorite"
        }
    }
    static var allCases: [ActivityType] {
        return [.registered, .updatedProfile, .updatedProfilePicture, .addedProduct, .addedGenre, markedEventFavorite, .markedPromoFavorite, .likedPhoto(name: "Juan De La Cruz")]
    }
    
    static func random() -> ActivityType {
        let randomIndex = Int(arc4random_uniform(UInt32(allCases.count)))
        return allCases[randomIndex]
    }
}

struct Activity {
    var type: ActivityType
    var date: Date
}
