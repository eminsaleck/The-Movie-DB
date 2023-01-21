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
  public let showsPersistenceRepository: ShowsVisitedLocalRepositoryProtocol
  public let loggedUserRepository: LoggedUserRepositoryProtocol

  public init(apiDataTransferService: DataTransferServiceProtocol,
              imagesBaseURL: String,
              showsPersistenceRepository: ShowsVisitedLocalRepositoryProtocol,
              loggedUserRepository: LoggedUserRepositoryProtocol) {
    self.apiDataTransferService = apiDataTransferService
    self.imagesBaseURL = imagesBaseURL
    self.showsPersistenceRepository = showsPersistenceRepository
    self.loggedUserRepository = loggedUserRepository
  }
}

public protocol ModuleMovieDetailsBuilder {
  func buildModuleCoordinator(in navigationController: UINavigationController,
                              delegate: MovieDetailCoordinatorDelegate?) -> MovieDetailCoordinatorProtocol
}

public protocol MovieDetailCoordinatorDelegate: AnyObject {
  func tvShowDetailCoordinatorDidFinish()
}

public protocol MovieDetailCoordinatorProtocol: NavigationCoordinator {
  func navigate(to step: ShowDetailsStep)
}

public enum ShowDetailsStep: Step {
  case showDetailsIsRequired(withId: Int, closures: MovieDetailViewModelClosures? = nil)
  case seasonsAreRequired(withId: Int)
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

  public let updateFavoritesShows: ( (_ updated: MovieUpdated) -> Void )?
  public let updateWatchListShows: ( (_ updated: MovieUpdated) -> Void )?

  public init (updateFavoritesShows: ( (_ updated: MovieUpdated) -> Void )? = nil ,
               updateWatchListShows: ( (_ updated: MovieUpdated) -> Void )? = nil) {
    self.updateFavoritesShows = updateFavoritesShows
    self.updateWatchListShows = updateWatchListShows
  }
}

