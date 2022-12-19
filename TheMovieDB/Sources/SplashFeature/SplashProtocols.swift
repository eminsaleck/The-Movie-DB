//
//  SplashProtocols.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

import Domain

protocol SplashViewModelProtocol {

    var initialDownloadsEnded: (() -> Void)? { get set }

    func startInitialDownloads()

}

public protocol SplashInteractorProtocol {

    /**
    * Fetch API configurations.
    */
    func getAppConfiguration(completion: @escaping (Result<Configuration, Error>) -> Void)

    /**
     * Fetch all the available movie genres
     */
    func getAllGenres(completion: @escaping (Result<[Genre], Error>) -> Void)

}
