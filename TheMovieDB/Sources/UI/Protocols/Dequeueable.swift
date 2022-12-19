//
//  Dequeueable.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit

protocol Dequeueable {

    static var dequeueIdentifier: String { get }

}

extension Dequeueable where Self: UIView {

    static var dequeueIdentifier: String {
        return String(describing: self)
    }

}

extension UITableViewCell: Dequeueable { }

extension UICollectionViewCell: Dequeueable { }
