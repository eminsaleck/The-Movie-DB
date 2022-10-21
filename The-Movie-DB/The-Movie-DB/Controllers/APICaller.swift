//
//  APICaller.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 21.10.2022.
//

import Foundation
import Alamofire


class APICaller {
    
    static let shared = APICaller()

 
    
    func fetchFilms(page: Int, completion: @escaping (Result<[Film], Error>) -> Void) {
   
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=a5ac3411803536cfb4b1cd90557dc8a7&language=en-US&page=\(page)"
         
        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: Films.self) { (response) in
                
                guard let originalData = response.value else { return }
                
                completion(.success(originalData.results))

            }
        }
    
}
