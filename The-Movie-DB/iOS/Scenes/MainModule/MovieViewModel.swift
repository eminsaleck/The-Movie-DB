//
//  MovieViewModel.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 28.10.2022.
//

import Foundation

struct MovieViewModel{
    
    private let movie: Film
    
    
    init(movie: Film){
        self.movie = movie
    }
}


extension MovieViewModel: Displayable {
    
    var poster: String{
        movie.posterPath
    }
    
    var review: String{
        movie.overview
    }
    
    var titleName: String{
        movie.title
    }
    
    var rating: Double{
        movie.voteAverage
    }
}
