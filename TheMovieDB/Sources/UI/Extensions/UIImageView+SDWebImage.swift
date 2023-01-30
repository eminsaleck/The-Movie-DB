//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 30.01.2023.
//

import UIKit
import SDWebImage

public extension UIImageView {
    func loadImage(imagePath: URL) {
            DispatchQueue.main.async {
            UIView.transition(with: self, duration: 0.1, options: .transitionCrossDissolve) { [weak self] in
                self?.sd_setImage(with: imagePath)
            }
        }
    }
}

