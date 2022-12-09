//
//  DetailViewModel.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 29.10.2022.
//

import Foundation
//import RxSwift

protocol DetailViewModelProtocol {
    var movie: Displayable? { get }
    var coordinator: DetailsCoordinatorProtocol! { get set }
//    func getTrailerKey() -> Observable<[String]>
    func getTitle() -> String
    func getImage() -> String
}

final class DetailViewModel: DetailViewModelProtocol {


    var coordinator: DetailsCoordinatorProtocol!
    var movie: Displayable?
    
    func getTitle() -> String{
        movie?.titleName ?? ""
    }
    
    func getImage() -> String{
        "https://image.tmdb.org/t/p/w500\(movie!.poster)"
    }
    func getIn() -> String{
        movie?.review ?? ""
    }
//    func getTrailerKey() -> Observable<[String]>{
//        guard let movieId = movie?.idTrailer else {
//            fatalError()
//        }
//        return NetworkManager.shared.fetchTrailer(movieID: movieId).map { $0.results.map { $0.key } }
//    }
    
}

