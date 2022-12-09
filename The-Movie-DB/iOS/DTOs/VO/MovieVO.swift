//
//  MovieVO.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 16.11.2022.
//

import Foundation

struct MovieVO: Hashable {
  let id: Int
  let original_title: String
  let overview: String
  let vote_average: Float
  let vote_count: Int
  let imageUrlPath: String?
  
  init(movie: Movie, imageUrlPath: String?) {
    self.id = movie.id
    self.original_title = movie.original_title
    self.overview = movie.overview
    self.vote_average = movie.vote_average ?? 0
    self.vote_count = movie.vote_count ?? 0
    self.imageUrlPath = imageUrlPath
  }
}
