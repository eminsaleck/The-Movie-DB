//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 28.01.2023.
//

import UI

enum ProfileSection: Equatable {
  case userInfo(items: [ProfilesSectionItem])
  case userLists(items: [ProfilesSectionItem])
  case logout(items: [ProfilesSectionItem])

  var sectionView: ProfileSectionView {
    switch self {
    case .userInfo:
      return .userInfo
    case .userLists:
      return .userLists
    case .logout:
      return .logout
    }
  }

  var items: [ProfilesSectionItem] {
    switch self {
    case let .userInfo(items):
      return items
    case let .userLists(items):
      return items
    case let .logout(items):
      return items
    }
  }
}

enum ProfileSectionView: Hashable {
  case userInfo
  case userLists
  case logout
}

enum ProfilesSectionItem: Hashable {
  case userInfo(number: Account)
  case userLists(items: UserListType)
  case logout(items: String)
}

enum UserListType: Hashable {
  case favorites
  case watchList
  
  var localizedDescription: String {
    switch self {
    case .favorites: return Localized.accountFavoritesCell.localized()
    case .watchList: return Localized.accountWatchlistCell.localized()
    }
  }
}

enum CellID{
    case plainCell
    case profileCell
    case logoutCell
    
    var id: String {
        switch self {
        case  .plainCell:
            return "PlainCell"
        case  .profileCell:
            return "ProfileTableViewCell"
        case  .logoutCell:
            return "LogoutTableViewCell"
        }
    }
}
