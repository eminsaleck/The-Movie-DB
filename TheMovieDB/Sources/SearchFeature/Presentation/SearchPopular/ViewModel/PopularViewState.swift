//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 13.02.2023.
//

import Foundation

enum PopularViewState {
  case loading
  case populated
  case empty
  case error(String)
}

extension PopularViewState: Equatable {

  static public func == (lhs: PopularViewState, rhs: PopularViewState) -> Bool {
    switch (lhs, rhs) {
    case (.loading, .loading):
      return true
    case (.populated, .populated):
      return true
    case (.empty, .empty):
      return true
    case (.error, .error):
      return true
    default:
      return false
    }
  }
}
