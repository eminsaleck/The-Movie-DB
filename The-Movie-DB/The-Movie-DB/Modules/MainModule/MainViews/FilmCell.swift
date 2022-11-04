//
//  FilmCell.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.10.2022.
//
import SDWebImage
import UIKit

class FilmCell: UICollectionViewCell {
    
    static var reuseId: String = "FilmCell"
    
    private let imageView: UIImageView = {
        $0.layoutIfNeeded()
        $0.layer.masksToBounds = true
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private let review: UILabel = {
        $0.textAlignment = .center
        $0.numberOfLines = 10
        $0.font = .systemFont(ofSize: 10)
        $0.tintColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let titleLabel: UILabel = {
        $0.textAlignment = .center
        $0.adjustsFontSizeToFitWidth = true
        $0.font = .systemFont(ofSize: 15)
        $0.tintColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let rating: UILabel = {
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = .systemFont(ofSize: 13)
        $0.tintColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupElements() {
        self.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        contentView.addSubview(imageView)
        contentView.addSubview(review)
        contentView.addSubview(titleLabel)
        contentView.addSubview(rating)        
    }
    
    func configure(with film: Displayable) {
        imageView.loadImage(imagePath: "https://image.tmdb.org/t/p/w500\(film.poster)")
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

