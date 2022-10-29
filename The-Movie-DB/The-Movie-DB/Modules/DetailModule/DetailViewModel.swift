//
//  DetailViewModel.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 29.10.2022.
//

import Foundation

protocol DetailViewModelProtocol {
  var movie: Film? { get }
    //var detailsVO: Observable<DetailsVO> { get }
}
final class DetailViewModel: DetailViewModelProtocol {
    var movie: Film?
    

}
    
