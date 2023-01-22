//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 22.01.2023.
//


import Foundation

public final class DefaultMoviePageMapper: MoviePageMapperProtocol {

  public init() { }

  public func mapTVShowPage(_ page: MoviePageDTO, imageBasePath: String, imageSize: ImageSize) -> MoviePage {
    let shows = page.showsList.compactMap { self.mapTVShow($0, imageBasePath: imageBasePath, imageSize: imageSize) }
    return MoviePage(page: page.page,
                      showsList: shows,
                      totalPages: page.totalPages,
                      totalShows: page.totalShows
    )
  }

  private func mapTVShow(_ show: Movie2DTO, imageBasePath: String, imageSize: ImageSize) -> MoviePage.Movie {

    let posterPath = show.posterPath ?? ""
    let posterPathURL = URL(string: "\(imageBasePath)/t/p/\(imageSize.rawValue)\(posterPath)")
    let backPath = show.backDropPath ?? ""
    let backPathURL = URL(string: "\(imageBasePath)/t/p/\(imageSize.rawValue)\(backPath)")

    return MoviePage.Movie(
      id: show.id,
      name: show.name,
      overview: show.overview,
      firstAirDate: show.firstAirDate ?? "",
      posterPath: posterPathURL,
      backDropPath: backPathURL,
      genreIds: show.genreIds ?? [],
      voteAverage: show.voteAverage,
      voteCount: show.voteCount
    )
  }
}
