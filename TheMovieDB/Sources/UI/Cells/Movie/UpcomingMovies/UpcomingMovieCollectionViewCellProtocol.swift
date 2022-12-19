//
//  UpcomingMovieCollectionViewCellProtocol.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit

protocol UpcomingMovieCollectionViewCellProtocol {

    var posterImageView: UIImageView! { get }
    var viewModel: UpcomingMovieCellViewModelProtocol? { get set }

}
