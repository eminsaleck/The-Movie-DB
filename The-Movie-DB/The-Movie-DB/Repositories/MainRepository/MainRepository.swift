//
//  MainRepository.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 16.11.2022.
//


import Foundation

enum ImageTypeSize {
  case backdrop
  case poster
}

enum LogoSizes: String {
  case w154
  case w300
  case w780
  case original
}

enum SecureType {
  case base
  case secure
}

typealias MovieVOHandler = (([MovieVO]) -> Void)?

protocol HomeRepositoryProtocol {
  func fetchMovies(with endPoint: RequestItem, handler: MovieVOHandler, imageTypeSize: ImageTypeSize)
}

final class HomeRepository: HomeRepositoryProtocol {
  
  let networkManager: NetworkManagerProtocol
  let storageManager: StorageManagerProtocol
  let imageManager: ImageManagerProtocol
  
  init(network: NetworkManagerProtocol,
       storage: StorageManagerProtocol,
       imageManager: ImageManagerProtocol) {
    self.networkManager = network
    self.storageManager = storage
    self.imageManager = imageManager
  }
  
  func fetchMovies(with endPoint: RequestItem, handler: MovieVOHandler, imageTypeSize: ImageTypeSize) {
    networkManager.sendDataRequest(endPoint: endPoint, response: MovieData.self, handler: .some {
      [weak self] movieData in
      guard let self = self else { return }
      self.responseData(with: movieData, handler: handler, imageTypeSize: imageTypeSize)
    })
  }
  
  fileprivate func responseData(with response: Result<MovieData, Error>, handler: MovieVOHandler, imageTypeSize: ImageTypeSize) {
    let group = DispatchGroup()
    var moviesVO: [MovieVO] = []
    
    switch response {
    case .success(let movieData):
      
      switch imageTypeSize {
      case .poster:
        _ = movieData.results.map { movie in
          if let posterPath = movie.poster_path {
            group.enter()
            imageManager.fetchImageConfiguration(with: .secure, size: .w300, handler: .some {
              imagePath in
              let imageUrlPath = imagePath + posterPath
              let movieVO = MovieVO(movie: movie, imageUrlPath: imageUrlPath)
              moviesVO.append(movieVO)
              group.leave()
            })
          }
        }
      case .backdrop:
        _ = movieData.results.map { movie in
          if let backdropPath = movie.backdrop_path {
            
            group.enter()
            imageManager.fetchImageConfiguration(with: .secure, size: .w780, handler: .some {
              imagePath in
              let imageUrlPath = imagePath + backdropPath
              let movieVO = MovieVO(movie: movie, imageUrlPath: imageUrlPath)
              moviesVO.append(movieVO)
              group.leave()
            })
          }
        }
      }
    
    case .failure(let error):
      print(error)
    }
    
    group.notify(queue: .global(qos: .background)) {
      handler?(moviesVO)
    }
  }
  
  func fetchMovieFromDB() {
    storageManager.fetchData()
  }
}
