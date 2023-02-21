//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Foundation

enum ExploreViewState {
  case loading
  case populated
  case empty
  case error(String)
}

extension ExploreViewState: Equatable {

  static public func == (lhs: ExploreViewState, rhs: ExploreViewState) -> Bool {
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
