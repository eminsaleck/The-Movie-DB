//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 25.02.2023.
//

import Foundation
import Combine

protocol MovieDetailViewModelProtocol {

  // MARK: - Input
  func viewDidLoad()
  func refreshView()
  func viewDidFinish()

  func favoriteButtonDidTapped()
  func watchedButtonDidTapped()

  // MARK: - Output
  func isUserLogged() -> Bool
  func navigateToSeasons()

  var viewState: CurrentValueSubject<DetailViewState, Never> { get }
  var isFavorite: CurrentValueSubject<Bool, Never> { get }
  var isWatchList: CurrentValueSubject<Bool, Never> { get }
}

enum DetailViewState: Equatable {
  case loading
  case populated(MovieDetailInfoModel)
  case error(String)

  static public func == (lhs: DetailViewState, rhs: DetailViewState) -> Bool {
    switch (lhs, rhs) {
    case (.loading, .loading):
      return true
    case (let .populated(lDetail), let .populated(rDetail)):
      return lDetail.id == rDetail.id
    case (.error, .error):
      return true
    default:
      return false
    }
  }
}
