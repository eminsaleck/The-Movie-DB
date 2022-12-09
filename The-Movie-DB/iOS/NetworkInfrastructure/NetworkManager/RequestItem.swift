//
//  Requesttem.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 16.11.2022.
//

import Foundation

enum RequestItem {
  //MARK: - Images
  case getImageConfiguration
  
  //MARK: - Movies
  case getLatestMovies
  case getNowPlayingMovies
  case getPopularMovies
  case getTopRatedMovies
  case getUpcomingMovies
  case getDetailsMovie(movie_id: Int)
  
  //MARK: - Auth
  case createAccessToken
  case deleteAccessToken
  
  //MARK: - Favorite
  case markAsFavorite(accountId: String)
  case getFavoriteMovie(accountId: String)

}

extension RequestItem: EndPointType {
  
  var scheme: String {
    switch self {
    case .getLatestMovies, .getNowPlayingMovies, .getPopularMovies, .getTopRatedMovies,
         .getUpcomingMovies, .getDetailsMovie, .getImageConfiguration, .createAccessToken,
         .deleteAccessToken, .markAsFavorite, .getFavoriteMovie:
      return "https"
    }
  }
  
  var host: String {
    switch self {
    case .getLatestMovies, .getNowPlayingMovies, .getPopularMovies, .getTopRatedMovies,
         .getUpcomingMovies, .getDetailsMovie, .getImageConfiguration, .createAccessToken,
         .deleteAccessToken, .markAsFavorite, .getFavoriteMovie:
      return "api.themoviedb.org"
    }
  }
  
  var path: String {
    switch self {
    case .getLatestMovies:
      return "/3/movie/latest"
    case .getNowPlayingMovies:
      return "/3/movie/now_playing"
    case .getPopularMovies:
      return "/3/movie/popular"
    case .getTopRatedMovies:
      return "/3/movie/top_rated"
    case .getUpcomingMovies:
      return "/3/movie/upcoming"
    case .getDetailsMovie(let movie_id):
      return "/3/movie/\(movie_id)"
      
    case .getImageConfiguration:
      return "/3/configuration"
      
    case .createAccessToken:
      return "/4/auth/access_token"
    case .deleteAccessToken:
      return "/4/auth/request_token"
      
    case .markAsFavorite(let accountId):
      return "/3/account/\(accountId)/favorite"
    case .getFavoriteMovie(let accountId):
      return "3/account/\(accountId)/favorite/movies"
    }
  }
  
  var httpMethod: HTTPMethod {
    switch self {
    case .getLatestMovies, .getNowPlayingMovies, .getPopularMovies, .getTopRatedMovies, .getUpcomingMovies,
         .getDetailsMovie, .getImageConfiguration, .getFavoriteMovie:
      return .get
    case .createAccessToken, .markAsFavorite:
      return .post
    case .deleteAccessToken:
      return .delete
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .getLatestMovies, .getNowPlayingMovies, .getPopularMovies, .getTopRatedMovies, .getUpcomingMovies,
         .getDetailsMovie, .getImageConfiguration, .createAccessToken, .deleteAccessToken, .markAsFavorite, .getFavoriteMovie:
      return ["Authorization" : "Bearer \(Constants.APICreditials.bearer.rawValue)"]
    }
  }
  
  var queryParameters: [String : String]? {
    switch self {
    case .getLatestMovies, .getNowPlayingMovies, .getPopularMovies, .getTopRatedMovies, .getUpcomingMovies,
         .getDetailsMovie, .getImageConfiguration, .createAccessToken, .deleteAccessToken, .getFavoriteMovie:
      return ["api_key" : "\(Constants.APICreditials.api_key.rawValue)",
              "language" : "en-US"]
    case .markAsFavorite:
      return ["api_key" : "\(Constants.APICreditials.api_key.rawValue)",
              "session_id" : "someId"]
    }
  }
}

