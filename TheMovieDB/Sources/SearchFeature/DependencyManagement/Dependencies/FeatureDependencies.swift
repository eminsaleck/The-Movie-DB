//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 31.01.2023.
//

import Foundation
import Network
import Persistance
import Common


public class FeatureDependencies{
    
    let apiDataTransferService: DataTransferServiceProtocol
    let imagesBaseURL: String
    let moviePersistence: MovieVisitedLocalRepositoryProtocol
    let searchsPersistence: SearchLocalRepositoryProtocol

    public init(apiDataTransferService: DataTransferServiceProtocol,
                imagesBaseURL: String,
                moviePersistence: MovieVisitedLocalRepositoryProtocol,
                searchsPersistence: SearchLocalRepositoryProtocol) {
      self.apiDataTransferService = apiDataTransferService
      self.imagesBaseURL = imagesBaseURL
      self.moviePersistence = moviePersistence
      self.searchsPersistence = searchsPersistence
    }
}
