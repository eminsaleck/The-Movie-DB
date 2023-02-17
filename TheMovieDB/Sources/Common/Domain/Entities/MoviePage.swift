//
//  TVShowPage.swift
//  
//
//  Created by Jeans Ruiz on 30/04/22.
//

import Foundation

public struct MoviePage {
  public let page: Int
  public let results: [Movie]
  public let totalPages: Int
  public let totalResults: Int


  public struct Movie: Hashable {
    public let id: Int
    public let name: String
    public let overview: String
    public let posterPath: URL?
    public let backDropPath: URL?
    public let genreIds: [Int]
    public let voteAverage: Double
    public let voteCount: Int
  }

  public init(page: Int, results: [Movie], totalPages: Int, totalResults: Int) {
    self.page = page
    self.results = results
    self.totalPages = totalPages
    self.totalResults = totalResults
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
