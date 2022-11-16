//
//  DataManager.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 22.10.2022.
//

import Foundation
import RealmSwift

final class StorageManager{
    
    private  let realm = try! Realm()
    private var filmsToPresent = [MovieVO]()
    private var iterationCounter = 0
    private var filmsInBase = 0
}
 
extension StorageManager: StorageManagerProtocol{
    func save(_ film: MovieVO){
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

    
    func getFilms() -> [MovieVO]{
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
    
    private func appendMovieFromCache() -> [MovieVO]{
        let arrayOfData = realm.objects(FilmRealm.self)
        var allFilms = [MovieVO]()
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


protocol StorageManagerProtocol{
    func save(_ film: MovieVO)
    func getFilms() -> [MovieVO]
}

