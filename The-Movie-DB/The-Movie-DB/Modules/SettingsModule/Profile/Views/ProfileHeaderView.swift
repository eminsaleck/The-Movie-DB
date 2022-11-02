//
//  ProfileHeaderView.swift
//  TabBarApp
//
//  Created by Greg Delgado on 9/24/19.
//  Copyright © 2019 greg. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    static let imageViewSize: CGFloat = 150.0
    var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar"))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = ProfileHeaderView.imageViewSize / 2.0
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 2.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func setup() {
        backgroundColor = UIColor.white
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: ProfileHeaderView.imageViewSize),
            imageView.widthAnchor.constraint(equalToConstant: ProfileHeaderView.imageViewSize),
        ])
        
    }
    
}
