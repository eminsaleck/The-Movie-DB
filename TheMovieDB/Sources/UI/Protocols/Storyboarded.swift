//
//  StoryBoarded.swift
//  UpcomingMovies
//
//  Created by Alonso on 11/1/19.
//  Copyright © 2019 Alonso. All rights reserved.
//

import UIKit

public protocol Storyboarded {

    static var storyboardName: String { get }
    static func instantiate() -> Self

}

public extension Storyboarded where Self: UIViewController {

    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]

        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)

        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }

}
