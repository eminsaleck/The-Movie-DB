//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 25.02.2023.
//

import Foundation
import Common

public struct MovieDetailInfoModel {
  var id: Int
  var backDropPath: URL?
  var nameShow: String?
  var yearsRelease: String?
  var duration: String?
  var genre: String?
  var numberOfEpisodes: String?
  var posterPath: URL?
  var overView: String?
  var score: String?
  var maxScore: String = "/10"
  var countVote: String?

  public init(show: MovieDetail) {
    id = show.id
    backDropPath = show.backDropPathURL
    nameShow = show.name
    yearsRelease = show.releaseYears
    duration = show.episodeDuration
    genre = show.genreIds.first?.name
    numberOfEpisodes = String(show.numberOfEpisodes)
    posterPath = show.posterPathURL
    overView = show.overview
    score = String(show.voteAverage)
    countVote = String(show.voteCount)
  }
}

