//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 31.01.2023.
//

import UIKit
import Persistance

final class ResultsView: UIView{
    
    
    init(frame: CGRect = .zero,
         searchMovieUseCase: SearchMovieUseCase,
         fetchRecentSearchesUseCase: FetchSearchesUseCase) {
        
        super.init(frame: frame)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
    }
    
}
