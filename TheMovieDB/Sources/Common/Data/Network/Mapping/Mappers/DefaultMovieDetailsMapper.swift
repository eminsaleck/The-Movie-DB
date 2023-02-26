//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.02.2023.
//

import Foundation

public final class DefaultMovieDetailsMapper: MovieDetailsMapperProtocol {

  public init() { }

  public func mapMovie(_ id: MovieDetailDTO, imageBasePath: String, imageSize: ImageSize) -> MovieDetail {
    let posterPath = id.posterPath ?? ""
    let posterPathURL = URL(string: "\(imageBasePath)/t/p/\(imageSize.rawValue)\(posterPath)")
    let backPath = id.backDropPath ?? ""
    let backPathURL = URL(string: "\(imageBasePath)/t/p/\(imageSize.rawValue)\(backPath)")

    let genres = id.genreIds?.map { Genre(id: $0.id, name: $0.name) } ?? []

    return MovieDetail(
      id: id.id,
      name: id.name, releaseDate: id.releaseDate ?? "",
      genreIds: genres,

      posterPathURL: posterPathURL,
      backDropPathURL: backPathURL,
      overview: id.overview ?? "",
      voteAverage: id.voteAverage ?? 0.0,
      voteCount: id.voteCount ?? 0
    )
  }
}
