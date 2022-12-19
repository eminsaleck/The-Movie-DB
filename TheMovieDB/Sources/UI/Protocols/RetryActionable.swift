//
//  RetryActionable.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

protocol RetryActionable {

    var retry: (() -> Void)? { get set }

    func resetState()

}
