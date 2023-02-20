//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 30.01.2023.
//

import UIKit
import SDWebImage

public extension UIImageView {
    func loadImage(imagePath: URL, placeholderImage: UIImage? = nil) {
        DispatchQueue.main.async {
            UIView.transition(with: self, duration: 0.1, options: .transitionCrossDissolve) { [weak self] in
                self?.sd_setImage(with: imagePath, placeholderImage: placeholderImage) { (image, error, cacheType, url) in
                    if error != nil {
                        self?.contentMode = .scaleAspectFit
                        self?.image = UIImage(named: "error")
                    }
                }
            }
        }
    }
}
