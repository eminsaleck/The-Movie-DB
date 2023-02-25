//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 20.02.2023.
//

import Foundation
import Network
import Common
import MovieDetailsFeatureInterface

public class FeatureDependencies{
    
    let apiDataTransferService: DataTransferServiceProtocol
    let imagesBaseURL: String
    let movieDetailsBuilder: ModuleMovieDetailsBuilderProtocol
    
    public init(apiDataTransferService: DataTransferServiceProtocol,
                imagesBaseURL: String,
                movieDetailsBuilder: ModuleMovieDetailsBuilderProtocol
    ) {
        self.apiDataTransferService = apiDataTransferService
        self.imagesBaseURL = imagesBaseURL
        self.movieDetailsBuilder = movieDetailsBuilder
    }
}

