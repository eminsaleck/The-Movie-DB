//
//  MovieReviewDetailProtocols.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 15.12.2022.
//

protocol MovieReviewDetailViewModelProtocol {

    var author: String { get }
    var content: String { get }

}

protocol MovieReviewDetailCoordinatorProtocol: AnyObject {

    func dismiss()

}
