//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 25.02.2023.
//

import Foundation
import Combine

final class MovieDetailViewModel: MovieDetailViewModelProtocol {
    let viewState = CurrentValueSubject<DetailViewState, Never>(.loading)
    let isFavorite = CurrentValueSubject<Bool, Never>(false)
    let isWatchList = CurrentValueSubject<Bool, Never>(false)
    
    init(){}
    
    func viewDidLoad() {
        //
    }
    
    func refreshView() {
        //
    }
    
    func viewDidFinish() {
        ///
    }
    
    func favoriteButtonDidTapped() {
        //
    }
    
    func watchedButtonDidTapped() {
        //
    }
    
    func isUserLogged() -> Bool {
        false
    }
    
    func navigateToSeasons() {
        //
    }
    
}
