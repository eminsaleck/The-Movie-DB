//
//  DetailsVO.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 16.11.2022.
//

import Foundation

struct DetailsVO {
  let homepage: String
  let tagline: String
  let status: String
  let runtime: Int
  let budget: Float
  let imageUrlPath: String
  let original_title: String
  let overview: String
  
  init() {
    self.homepage = ""
    self.tagline = ""
    self.status = ""
    self.runtime = 0
    self.budget = 0
    self.imageUrlPath = ""
    self.original_title = ""
    self.overview = ""
  }
  
  init(details: DetailsData, imageUrlPath: String) {
    self.homepage = details.homepage
    self.tagline = details.tagline
    self.status = details.status
    self.runtime = details.runtime
    self.budget = details.budget
    self.imageUrlPath = imageUrlPath
    self.original_title = details.original_title
    self.overview = details.overview
  }
}
