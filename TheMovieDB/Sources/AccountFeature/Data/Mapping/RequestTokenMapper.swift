//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 26.01.2023.
//

import Foundation
import Network

protocol RequestTokenMapperProtocol {
  func mapRequestToken(model: NewRequestTokenDTO) throws -> NewRequestToken
}

struct RequestTokenMapper: RequestTokenMapperProtocol {
  private let authenticateBaseURL: String

  init(authenticateBaseURL: String) {
    self.authenticateBaseURL = authenticateBaseURL
  }
  
  func mapRequestToken(model: NewRequestTokenDTO) throws -> NewRequestToken {
    if model.success == true,
       let url = URL(string: "\(authenticateBaseURL)/\(model.token)") {
      return NewRequestToken(token: model.token, url: url)
    } else {
      print("cannot Convert request token= \(model), basePath=\(authenticateBaseURL)")
      throw DataTransferError.noResponse 
    }
  }
}
