//
//  FilmCell.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.10.2022.
//

import Foundation
import UIKit

class FilmCell: UICollectionViewCell {
    
    static var reuseId: String = "FilmCell"
    
    let imageView = UIImageView()
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(white: 1, alpha: 1)
        setupElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupElements() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
//    func configure(with chat: Chat) {
//        imageView.image = UIImage(named: chat.image)
//    }
    
   
}

extension FilmCell {
    func setupConstraints() {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        self.clipsToBounds = true
        
       // imageView.layoutIfNeeded()
       // imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        contentView.addSubview(imageView)
        
        imageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, traling: trailingAnchor)
        
    }
}
