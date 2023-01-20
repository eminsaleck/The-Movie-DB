//
//  TVShowPage.swift
//  
//
//  Created by Jeans Ruiz on 30/04/22.
//

import Foundation

public struct MoviePage {
  public let page: Int
  public let showsList: [Movie]
  public let totalPages: Int
  public let totalShows: Int


  public struct Movie: Hashable {
    public let id: Int
    public let name: String
    public let overview: String

    public let firstAirDate: String

    public let posterPath: URL?

    public let backDropPath: URL?

    public let genreIds: [Int]
    public let voteAverage: Double
    public let voteCount: Int
  }

  public init(page: Int, showsList: [Movie], totalPages: Int, totalShows: Int) {
    self.page = page
    self.showsList = showsList
    self.totalPages = totalPages
    self.totalShows = totalShows
  }
}

extension MoviePage {

  public var hasMorePages: Bool {
    return totalPages > page
  }

  public var nextPage: Int {
    return page + 1
  }
}
