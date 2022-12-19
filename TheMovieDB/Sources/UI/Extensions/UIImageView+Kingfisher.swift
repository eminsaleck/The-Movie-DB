//
//  UIImageView+Kingfisher.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit
import Kingfisher

public extension UIImageView {

    public func setImage(with url: URL?) {
        kf.indicatorType = .activity
        kf.setImage(with: url)
    }

    public func cancelImageDownload() {
        kf.cancelDownloadTask()
    }

}
