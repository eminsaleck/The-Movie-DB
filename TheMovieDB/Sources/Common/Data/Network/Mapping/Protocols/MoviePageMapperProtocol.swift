//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 22.01.2023.
//

import Foundation

public protocol MoviePageMapperProtocol {
  func mapMoviePage(_ page: MoviePageDTO, imageBasePath: String, imageSize: ImageSize) -> MoviePage
}

public enum ImageSize: String {
  case small = "w342"
  case medium = "w780"
}

public protocol AccountMovieDetailsMapperProtocol {
  func mapActionResult(result: MovieActionStatusDTO) -> MovieActionStatus
  func mapTVShowStatusResult(result: MovieAccountStatusDTO) -> MovieAccountStatus
}
