//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Combine
import Common
import UI

final class ExploreViewModel: ExploreViewModelProtocol {

    let viewStateObservableSubject: CurrentValueSubject<SimpleViewState<MovieCellViewModel>, Never> = .init(.loading)
            
    weak var coordinator: ExploreCoordinatorProtocol?

    init() { }
    
    func viewDidLoad() {
        //
    }
    
    func willDisplayItem(_ item: Int, outOf totalRows: Int) {
        //
    }
    
    func refreshView() {
        //
    }
    
    
    private func navigateWith(state: ExploreState) {
        coordinator?.navigate(with: state)
    }
    
    func movieIsPicked(index id: Int) {
        navigateWith(state: .movieIsPicked(id: id))
    }
    
    func moviesByGenre(id: Int){
        navigateWith(state: .allIsPicked(id: id))
    }
}
