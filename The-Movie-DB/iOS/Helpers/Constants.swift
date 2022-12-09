//
//  Constants.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 16.11.2022.
//

import Foundation
import UIKit

struct Constants {
  
  enum APICreditials: String {
    // TODO: - Save to keychain
    case api_key = "a1e6469b9c841dbf821f4ef57f4d74f0"
    case bearer = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMWU2NDY5YjljODQxZGJmODIxZjRlZjU3ZjRkNzRmMCIsInN1YiI6IjYwMzM1OGY5OWFmMTcxMDAzZjQ1YjNiNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.H-f-0iZNchiOoPmJc42k5p7vszMqsvOqd9K-6p1JiL0"
  }

  enum ScreenTitles: String, RawRepresentable {
    case main = "Main"
    case search = "Search"
    case favourites = "Favourites"
    case profile = "Profile"
  }
  
  enum Images {
      // TODO: - Refactor
  }
  
  enum Colors {
    static let dark = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1)
  }

    enum CellIdentifier: String, RawRepresentable {
        case filmCell = "FilmCell"
        case discoverViewCell = "TitleTableViewCell"
    }

}

