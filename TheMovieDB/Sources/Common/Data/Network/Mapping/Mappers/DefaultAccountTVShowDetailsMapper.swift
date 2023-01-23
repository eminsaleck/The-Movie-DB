//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 23.01.2023.
//

import Foundation

public final class DefaultAccountMovieDetailsMapper: AccountMovieDetailsMapperProtocol {

  public init() { }

  public func mapActionResult(result: MovieActionStatusDTO) -> MovieActionStatus {
    return MovieActionStatus(statusCode: result.code, statusMessage: result.message ?? "")
  }

  public func mapTVShowStatusResult(result: MovieAccountStatusDTO) -> MovieAccountStatus {
    return MovieAccountStatus(showId: result.showId, isFavorite: result.isFavorite, isWatchList: result.isWatchList)
  }
}
