//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 13.02.2023.
//

import Combine

final class SearchPopularViewModel: SearchPopularViewModelProtocol{
    
    let viewState = CurrentValueSubject<PopularViewState, Never>(.loading)

    let dataSource = CurrentValueSubject<[SearchPopularSectionModel], Never>([])

    
    init(){}
    
    func modelIsPicked(with item: SearchSectionItem) {
        //
    }
    
    
    
    func viewDidLoad() {
        //
    }
    
    
}
