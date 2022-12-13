//
//  Utils.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 13.11.2022.
//

import UIKit

func degreesToRadians (_ value: CGFloat) -> CGFloat {
    let piDegrees: CGFloat = 180.0
    return (value * CGFloat.pi) / piDegrees
}

func radiansToDegrees (_ value: CGFloat) -> CGFloat {
    let piDegrees: CGFloat = 180.0
    return (value * piDegrees) / CGFloat.pi
}
