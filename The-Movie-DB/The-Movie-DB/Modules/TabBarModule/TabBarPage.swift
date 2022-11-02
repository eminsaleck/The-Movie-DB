//
//  TabBarPage.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 02.11.2022.
//

import Foundation
import UIKit

enum TabBarPage: String, CaseIterable  {
    case main
    case search
    case profile
    case favourites

    init?(index: Int) {
        switch index {
        case 0:
            self = .main
        case 1:
            self = .search
        case 2:
            self = .favourites
        case 3:
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
        case .favourites:
            return "Favourites"
        case .profile:
            return "Profile"
        }
    }
    
    func icon() -> UIImage? {
        switch self {
        case .main:
            return UIImage(systemName: "magnifyingglass.circle")?.withTintColor(.black.withAlphaComponent(0.4), renderingMode: .alwaysOriginal)
        case .search:
            return UIImage(systemName: "magnifyingglass.circle")?.withTintColor(.black.withAlphaComponent(0.4), renderingMode: .alwaysOriginal)
        case .favourites:
            return UIImage(systemName: "heart.circle")?.withTintColor(.black.withAlphaComponent(0.4), renderingMode: .alwaysOriginal)
        case .profile:
            return UIImage(systemName: "person.crop.circle")?.withTintColor(.black.withAlphaComponent(0.4), renderingMode: .alwaysOriginal)
        }
    }
    
    
    func selectedIcon() -> UIImage? {
          switch self {
          case .main:
              return UIImage(systemName: "person.crop.circle.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
          case .search:
              return UIImage(systemName: "magnifyingglass.circle.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
          case .favourites:
              return UIImage(systemName: "heart.circle.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
          case .profile:
              return UIImage(systemName: "person.crop.circle.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
          }
      }
    
    func pageOrderNumber() -> Int {
        switch self {
        case .main:
            return 0
        case .search:
            return 1
        case .favourites:
            return 2
        case .profile:
            return 3
        }
    }

}
