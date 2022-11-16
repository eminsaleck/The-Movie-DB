//
//  Images.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 16.11.2022.
//

import Foundation

struct ImagesData: Codable {
  var images: Images?
}

struct Images: Codable {
  var base_url: String?
  var secure_base_url: String?
  var backdrop_sizes: [String]?
  var logo_sizes: [String]?
  var poster_sizes: [String]?
  var profile_sizes: [String]?
  
  var w154: String?
  var w300: String?
  var w500: String?
  var w780: String?
  var original: String?

  init(from decoder: Decoder) throws {
    let value = try decoder.container(keyedBy: Images.CodingKeys.self)
    let logoSizes = try value.decode([String].self, forKey: .logo_sizes)
    base_url = try value.decode(String?.self, forKey: .base_url)
    secure_base_url = try value.decode(String?.self, forKey: .secure_base_url)

    let ls = logoSizes.map { (size) -> LogoSizesImages in
      let l: LogoSizesImages = LogoSizesImages(size: size)
      return l
    }
        
    let dict = ls.reduce([String : LogoSizesImages]()) {
      (result, logoSize) -> [String : LogoSizesImages] in

      var result = result
      result[logoSize.size] = logoSize
      return result
    }
    
    if let logoW300 = dict[LogoSizes.w300.rawValue]?.size {
      w300 = logoW300
    }
    
    if let logoW780 = dict[LogoSizes.w780.rawValue]?.size {
      w780 = logoW780
    }
  }
}

struct LogoSizesImages: Codable {
  var size: String
}

