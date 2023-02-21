//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 21.02.2023.
//

import Common

public struct GenreMovies: Hashable {
    
    public init(id: Int, name: String, movies: [MoviePage.Movie]) {
        self.id = id
        self.name = name
        self.movies = movies
    }
    
    public let movies: [MoviePage.Movie]
    public let id: Int
    public let name: String
}
