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
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
        contentView.addSubview(imageView)
   
    }
    
    func configure(with film: Displayable) {
        imageView.loadImage(imagePath: "https://image.tmdb.org/t/p/w500\(film.poster)")
    }
}

extension FilmCell {
    private func setupConstraints() {
        
        
        NSLayoutConstraint.activate([
                                     imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
                                     imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     imageView.topAnchor.constraint(equalTo: topAnchor)                                     
                                    ])
        
    }
}

