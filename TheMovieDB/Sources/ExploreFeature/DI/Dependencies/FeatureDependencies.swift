//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 20.02.2023.
//

import Foundation
import Network
import Common


public class FeatureDependencies{
    
    let apiDataTransferService: DataTransferServiceProtocol
    let imagesBaseURL: String

    public init(apiDataTransferService: DataTransferServiceProtocol,
                imagesBaseURL: String) {
      self.apiDataTransferService = apiDataTransferService
      self.imagesBaseURL = imagesBaseURL
    }
}

