//
//  APICaller.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 21.10.2022.
//

import Foundation
import Alamofire
import RxSwift

//typealias TrailerHandler = ((DetailsData) -> Void)?

protocol NetworkManagerProtocol{
    func fetchMovieListByGenre(genre: Int, completion: @escaping (Result<[Film], Error>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    var apiKey = "a5ac3411803536cfb4b1cd90557dc8a7"
    
    static let shared = NetworkManager()
    var isPageRefreshing: Bool = false
    var page = 1


    
    func fetchTrailer(movieID: Int) -> Observable<DetailsData>{

        return Observable.create { observer -> Disposable in

            let url = "https://api.themoviedb.org/3/movie/\(movieID)/videos?api_key=\(self.apiKey)&language=en-US"
            
            AF.request(url, method: .get).responseJSON { responseJSON in
                let decoder = JSONDecoder()
                guard let responseData = responseJSON.data else {return}
                do {
                    let data = try decoder.decode(DetailsData.self, from: responseData)
                    let detailsData = data
                    observer.onNext(detailsData)
                    observer.onCompleted()

                } catch {
                    print("nooo")
                }
            }
            return Disposables.create {
                
            }
        }.subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
        
    }
    func fetchMovieListByGenre(genre: Int, completion: @escaping (Result<[Film], Error>) -> Void){

            let url = "https://api.themoviedb.org/3/discover/movie?api_key=\(self.apiKey)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres=\(genre)&with_watch_monetization_types=flatrate"
            
            AF.request(url, method: .get).responseJSON { responseJSON in
                let decoder = JSONDecoder()
                guard let responseData = responseJSON.data else {return}
                do {
                    let data = try decoder.decode(Films.self, from: responseData)
                     let filmArray = data.results
                    
                    completion(.success(filmArray))
                } catch {
                    print("nooo")
                }
            }
        
        }
        
    }


