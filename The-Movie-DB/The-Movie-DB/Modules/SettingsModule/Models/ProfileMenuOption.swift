//
//  ProfileMenuOption.swift
//  TabBarApp
//
//  Created by Greg Delgado on 10/4/19.
//  Copyright © 2019 greg. All rights reserved.
//

import Foundation

enum ProfileMenuOption: Int, MenuOption, CaseIterable {
    
    case userprofile
    case notifications
    case products
    case activities
    case genre
    case signout
    
    var description: String {
        switch self {
        case .userprofile: return ""
        case .notifications: return "Notifications"
        case .products: return "My Cameras"
        case .activities: return "Activities"
        case .genre: return "Genres"
        case .signout: return "Sign out"
        }
    }
    
    var image: String {
        switch self {
        case .userprofile: return ""
        case .notifications: return "ic_alarm_filled"
        case .products: return "ic_camera_filled"
        case .activities: return "ic_hourglass_filled"
        case .genre: return "ic_list_filled"
        case .signout: return "ic_exit_filled"
        }
    }
}
