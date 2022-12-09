//
//  EndPointType.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 16.11.2022.
//

import Foundation

protocol EndPointType {
  var scheme: String { get }
  var host: String { get }
  var path: String { get }
  var httpMethod: HTTPMethod { get }
  var headers: [String: String]? { get }
  var queryParameters: [String: String]? { get }
}


