//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.01.2023.
//


public protocol FetchLoggedUser {
  func execute() -> LoggedUserRepositoryProtocol
}

public final class DefaultFetchLoggedUser: FetchLoggedUser {
  private let loggedRepository: LoggedUserRepositoryProtocol

  public init(loggedRepository: LoggedUserRepositoryProtocol) {
    self.loggedRepository = loggedRepository
  }

  public func execute() -> LoggedUserRepositoryProtocol {
    return loggedRepository
  }
}
