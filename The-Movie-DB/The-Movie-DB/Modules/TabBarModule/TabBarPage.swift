//
//  TabBarPage.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 02.11.2022.
//

import Foundation

enum TabBarPage {
    case main
    case search
    case profile

    init?(index: Int) {
        switch index {
        case 0:
            self = .main
        case 1:
            self = .search
        case 2:
            self = .profile
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .main:
            return "Main"
        case .search:
            return "Search"
        case .profile:
            return "Profile"
        }
    }

    func pageOrderNumber() -> Int {
        switch self {
        case .main:
            return 0
        case .search:
            return 1
        case .profile:
            return 2
        }
    }

    // Add tab icon value
    
    // Add tab icon selected / deselected color
    
    // etc
}
