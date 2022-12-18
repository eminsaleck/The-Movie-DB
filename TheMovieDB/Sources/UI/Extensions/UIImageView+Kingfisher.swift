//
//  UIImageView+Kingfisher.swift
//  UpcomingMovies
//
//  Created by Alonso on 10/13/19.
//  Copyright © 2019 Alonso. All rights reserved.
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
