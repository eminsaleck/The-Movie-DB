//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.01.2023.
//

import UIKit
import Network
import Common
import MovieDetailsFeatureInterface

public struct ModuleDependencies {

  public let apiDataTransferService: DataTransferServiceProtocol
  public let imagesBaseURL: String
  public let loggedUserRepository: LoggedUserRepositoryProtocol
    public let showDetailsBuilder: ModuleMovieDetailsBuilderProtocol

  public init(apiDataTransferService: DataTransferServiceProtocol,
              imagesBaseURL: String,
              loggedUserRepository: LoggedUserRepositoryProtocol,
              showDetailsBuilder: ModuleMovieDetailsBuilderProtocol) {
    self.apiDataTransferService = apiDataTransferService
    self.imagesBaseURL = imagesBaseURL
    self.loggedUserRepository = loggedUserRepository
    self.showDetailsBuilder = showDetailsBuilder
  }
}

public protocol ModuleMovieListDetailsBuilderProtocol {
  func buildModuleCoordinator(in navigationController: UINavigationController,
                              delegate: MovieListCoordinatorDelegate?) -> MovieListCoordinatorProtocol
}

public protocol MovieListCoordinatorProtocol: NavigationCoordinator {
  func navigate(to state: MovieListState)
}

public protocol MovieListCoordinatorDelegate: AnyObject {
  func tvShowListCoordinatorDidFinish()
}

// MARK: - Steps
public enum MovieListState: State {
  case genreList(genreId: Int, title: String?)
  case favoriteList
  case watchList
  case showIsPicked(showId: Int,
                    stepOrigin: MovieListStepOrigin?,
                    closure: (_ updated: MovieUpdated) -> Void)
  case showListDidFinish
}

// MARK: - Steps Origin
public enum MovieListStepOrigin {
  case favoriteList
  case watchList
}
