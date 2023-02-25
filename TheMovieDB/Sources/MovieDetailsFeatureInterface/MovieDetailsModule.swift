//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.01.2023.
//

import UIKit
import Common
import Network
import Persistance


public struct ModuleDependencies {

  public let apiDataTransferService: DataTransferServiceProtocol
  public let imagesBaseURL: String
  public let loggedUserRepository: LoggedUserRepositoryProtocol

  public init(apiDataTransferService: DataTransferServiceProtocol,
              imagesBaseURL: String,
              loggedUserRepository: LoggedUserRepositoryProtocol) {
    self.apiDataTransferService = apiDataTransferService
    self.imagesBaseURL = imagesBaseURL
    self.loggedUserRepository = loggedUserRepository
  }
}

public protocol ModuleMovieDetailsBuilderProtocol {
  func buildModuleCoordinator(in navigationController: UINavigationController,
                              delegate: MovieDetailCoordinatorDelegate?) -> MovieDetailCoordinatorProtocol
}

public protocol MovieDetailCoordinatorDelegate: AnyObject {
  func movieDetailCoordinatorDidFinish()
}

public protocol MovieDetailCoordinatorProtocol: NavigationCoordinator {
  func navigate(with state: MovieDetailsState)
}

public enum MovieDetailsState: State {
  case movieDetailsIsRequired(withId: Int, closures: MovieDetailViewModelClosures? = nil)
  case detailViewDidFinish
}

public struct MovieUpdated {
  public let showId: Int
  public let isActive: Bool

  public init(showId: Int, isActive: Bool) {
    self.showId = showId
    self.isActive = isActive
  }
}

public struct MovieDetailViewModelClosures {

  public let updateFavoritesMovies: ( (_ updated: MovieUpdated) -> Void )?
  public let updateWatchListMovies: ( (_ updated: MovieUpdated) -> Void )?

  public init (updateFavoritesMovies: ( (_ updated: MovieUpdated) -> Void )? = nil ,
               updateWatchListMovies: ( (_ updated: MovieUpdated) -> Void )? = nil) {
    self.updateFavoritesMovies = updateFavoritesMovies
    self.updateWatchListMovies = updateWatchListMovies
  }
}

