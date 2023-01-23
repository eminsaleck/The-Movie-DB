//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 19.01.2023.
//

import Foundation

public protocol AppConfigurationProtocol {
  var apiKey: String { get set }
  var apiBaseURL: URL { get set }
  var imagesBaseURL: String { get set }
  var authenticateBaseURL: String { get set }
  var gravatarBaseURL: String { get set }
}
