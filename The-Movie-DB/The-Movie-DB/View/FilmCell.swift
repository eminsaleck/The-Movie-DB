//
//  FilmCell.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.10.2022.
//

import Foundation
import SDWebImage
import UIKit

class FilmCell: UICollectionViewCell {
    
    static var reuseId: String = "FilmCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layoutIfNeeded()
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .black
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let review: UILabel = {
        let review = UILabel()
        review.textAlignment = .center
        review.numberOfLines = 10
        review.font = .systemFont(ofSize: 10)
        review.translatesAutoresizingMaskIntoConstraints = false
        return review
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let rating: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
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
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.clipsToBounds = true
        
        contentView.addSubview(imageView)
        contentView.addSubview(review)
        contentView.addSubview(titleLabel)
        contentView.addSubview(rating)
        
    }
    
    func configure(with film: Displayable) {
        imageView.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(film.poster)"))
        review.text = film.review
        titleLabel.text = film.titleName
        rating.text = String(film.rating)
    }
    
    
}

extension FilmCell {
    private func setupConstraints() {

        NSLayoutConstraint.activate([review.leadingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
                                     review.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                                     review.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                                     review.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     
                                     rating.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -8),
                                     rating.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
                                     
                                     titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                                     titleLabel.centerXAnchor.constraint(equalTo: review.centerXAnchor),
                                    titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     
                                     imageView.bottomAnchor.constraint(equalTo: rating.topAnchor, constant: -10),
                                     imageView.trailingAnchor.constraint(equalTo: review.leadingAnchor, constant: -10),
                                     imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                                     imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                                     imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 2/1)
                                     
                                    ])
        
    }
}
