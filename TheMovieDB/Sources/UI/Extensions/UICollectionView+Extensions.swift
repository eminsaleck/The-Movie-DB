//
//  UICollectionView+Extensions.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit

extension UICollectionView {

    func isScrolledToTop() -> Bool {
        return contentOffset == .zero
    }

    func scrollToTop(animated: Bool) {
        setContentOffset(.zero, animated: animated)
    }

    // MARK: - Cell Register

    func register<T: UICollectionViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let identifier = cellType.dequeueIdentifier
        register(cellType, forCellWithReuseIdentifier: identifier)
    }

    // MARK: - Nib Register

    func registerNib<T: UICollectionViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let identifier = cellType.dequeueIdentifier
        let nib = UINib(nibName: identifier, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: identifier)
    }

    // MARK: - Dequeuing

    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: type.dequeueIdentifier, for: indexPath) as! T
    }

}
