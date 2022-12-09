//
//  DetailsData.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 16.11.2022.
//

import Foundation

struct DetailsData: Codable {
  let homepage: String
  let tagline: String
  let status: String
  let runtime: Int
  let budget: Float
  let backdrop_path: String
  let original_title: String
  let overview: String
}
