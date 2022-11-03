//
//  DetailViewModel.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 29.10.2022.
//

import Foundation

protocol DetailViewModelProtocol {
    var movie: Film? { get }
    var coordinator: DetailsCoordinator! { get set }
    func getPicture() -> String
}

final class DetailViewModel: DetailViewModelProtocol {
    
    var coordinator: DetailsCoordinator!
    var movie: Film?
    
    func getPicture() -> String {
        movie?.posterPath ?? ""
    }

}

