//
//  ImageTransitionable.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit

protocol Transitionable: UIViewController {

    var transitionContainerView: UIView! { get }

}

protocol TransitionableInitiator: UIViewController {}
