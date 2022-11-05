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
    func fetchMovies(pagination: Bool) -> Observable<[Film]>

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
        }
        
    }
    
    func fetchMovies(pagination: Bool = false) -> Observable<[Film]> {
        
        return Observable.create { observer -> Disposable in
            if pagination{
                self.incrementPage(pagination)
                print("PAGE WE ARE ON: \(self.page)")
                self.isPageRefreshing = true
            }
            let url = "https://api.themoviedb.org/3/movie/popular?api_key=\(self.apiKey)&language=en-US&page=\(self.page)"
            
            AF.request(url, method: .get).responseJSON { responseJSON in
                let decoder = JSONDecoder()
                guard let responseData = responseJSON.data else {return}
                do {
                    let data = try decoder.decode(Films.self, from: responseData)
                    let filmArray = data.results
                    observer.onNext(filmArray)
                } catch {
                    print("nooo")
                }
                if pagination {
                    self.isPageRefreshing = false
                }
            }
            return Disposables.create {
                
            }
        }
    }

    private func incrementPage(_ pagination: Bool) -> Int{
        if pagination == true{
            page += 1
            return page
        }
        if pagination == false{
            page -= 1
        }
        return page
    }
}
