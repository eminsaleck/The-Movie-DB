//
//  NetworkExtension.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.10.2022.
//

import Foundation
import Alamofire


extension ViewController{
 func fetchFilms() {
    let url = "https://api.themoviedb.org/3/movie/popular?api_key=a5ac3411803536cfb4b1cd90557dc8a7&language=en-US&page=1"
    
    AF.request(url, method: .get)
        .validate()
        .responseDecodable(of: Films.self) { (response) in
    guard let films = response.value else { return }
            self.dataSource.films = films.results //Films -> into Realm
            self.dataSource.items = films.results
            self.collectionView.reloadData()
        }
    }
}
