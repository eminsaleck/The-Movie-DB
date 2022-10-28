//
//  UIImageView + SDWEB.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 25.10.2022.
//
import UIKit
import SDWebImage

extension UIImageView {
    func loadImage(imagePath: String) {
        guard let imageURL = URL(string: imagePath) else { return }
            DispatchQueue.main.async {
            UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve) { [weak self] in
                self?.sd_setImage(with: imageURL)
            }
        }
    }
}

