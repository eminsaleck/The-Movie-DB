//
//  DataManager.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 22.10.2022.
//

import Foundation
import RealmSwift

final class DataManager{
    
    private  let realm = try! Realm()
    private var filmsToPresent = [Film]()
    private var iterationCounter = 0
    private var filmsInBase = 0
}
 
extension DataManager: DataManagerProtocol{
    func save(_ film: Film){
//        let filmRealm = FilmRealm()
//        filmRealm.id = film.id
//        filmRealm.adult = film.adult
//        filmRealm.title = film.title
//        filmRealm.overview = film.overview
//        filmRealm.posterPath = film.posterPath
//        filmRealm.popularity = film.popularity
//        filmRealm.voteCount = film.voteCount
//
//        do {
//            try? realm.write {
//                realm.add(filmRealm, update: .all)
//            }
//
//        } catch{
//            print("failed")
//        }
    }

    
    func getFilms() -> [Film]{
        var count = 0
        let allFilms = appendMovieFromCache()
        filmsInBase = allFilms.count
        print("FILMS IN DATABASE: \(filmsInBase)")
        for _ in allFilms {
            filmsToPresent.append(allFilms[iterationCounter])
                //iterationCounter += 1
                count += 1
                if count == 20{
                    break
                }
            }
        return allFilms
    }
    
    private func appendMovieFromCache() -> [Film]{
        let arrayOfData = realm.objects(FilmRealm.self)
        var allFilms = [Film]()
//        
//        for film in arrayOfData{
//            let filmElement = Film(adult: film.adult,
//                                   backdropPath: film.backdropPath,
//                                   genreIDS: [],
//                                   id: film.id,
//                                   originalLanguage: "en",
//                                   originalTitle: film.originalTitle,
//                                   overview: film.overview,
//                                   popularity: film.popularity,
//                                   posterPath: film.posterPath,
//                                   releaseDate: "",
//                                   title: film.title,
//                                   video: false,
//                                   voteAverage: film.voteAverage,
//                                   voteCount: film.voteCount)
//            allFilms.append(filmElement)
//        }
        return allFilms
    }
}


protocol DataManagerProtocol{
    func save(_ film: Film)
    func getFilms() -> [Film]
}

