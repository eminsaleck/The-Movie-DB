//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 22.01.2023.
//


import Foundation

public final class DefaultMoviePageMapper: MoviePageMapperProtocol {

  public init() { }

  public func mapMoviePage(_ page: MoviePageDTO, imageBasePath: String, imageSize: ImageSize) -> MoviePage {
    let movies = page.results.compactMap { self.mapMovie($0, imageBasePath: imageBasePath, imageSize: imageSize) }
     
    return MoviePage(page: page.page,
                      results: movies,
                      totalPages: page.totalPages,
                      totalResults: page.totalResults
    )
  }

  private func mapMovie(_ show: Movie2DTO, imageBasePath: String, imageSize: ImageSize) -> MoviePage.Movie {
    
    let posterPath = show.posterPath ?? ""
    let posterPathURL = URL(string: "\(imageBasePath)/t/p/\(imageSize.rawValue)\(posterPath)")
    let backPath = show.backDropPath ?? ""
    let backPathURL = URL(string: "\(imageBasePath)/t/p/\(imageSize.rawValue)\(backPath)")

    return MoviePage.Movie(
      id: show.id,
      name: show.name,
      overview: show.overview,
      posterPath: posterPathURL,
      backDropPath: backPathURL,
      genreIds: show.genreIds ?? [],
      voteAverage: show.voteAverage,
      voteCount: show.voteCount
    )
  }
}
