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
    //var detailsVO: Observable<DetailsVO> { get }
}

final class DetailViewModel: DetailViewModelProtocol {
    var coordinator: DetailsCoordinator!
    var movie: Film?
    

}
    
