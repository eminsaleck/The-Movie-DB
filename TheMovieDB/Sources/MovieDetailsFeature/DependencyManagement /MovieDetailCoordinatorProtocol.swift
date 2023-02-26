//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 23.01.2023.
//

import UIKit
import Common
import MovieDetailsFeatureInterface

protocol MovieDetailCoordinatorDependencies {
  func buildMovieDetailsViewController(with movieId: Int,
                                      coordinator: MovieDetailCoordinatorProtocol?,
                                      closures: MovieDetailViewModelClosures?) -> UIViewController
}
