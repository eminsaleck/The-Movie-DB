//
//  TVShowDetail.swift
//
//  Created by Jeans on 8/21/19.
//  Copyright © 2019 Jeans. All rights reserved.
//

import Foundation

public struct MovieDetail: Hashable {
  public let id: Int
  public let name: String
  public let releaseDate: String
  public let genreIds: [Genre]
  public var posterPathURL: URL?
  public var backDropPathURL: URL?
  public let overview: String

  public let voteAverage: Double
  public let voteCount: Int

}
