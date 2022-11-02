
//
//  PhotoGridCell.swift
//  TabBarApp
//
//  Created by Greg Delgado on 10/2/19.
//  Copyright © 2019 greg. All rights reserved.
//

import UIKit

class PhotoGridCell: UICollectionViewCell {
    private var dataTask: URLSessionDataTask?
    
    var activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .gray)
        view.hidesWhenStopped = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        contentView.backgroundColor = .white
        contentView.addSubview(imageView)
        contentView.addSubview(activityIndicatorView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        let constraints = [
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            activityIndicatorView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func configure(with imageModel: ImageModel, session: URLSession) {
        
        guard imageView.image == nil else {
            return
        }
        let url = imageModel.imageURL
        activityIndicatorView.startAnimating()
        
        let dataTask = session.dataTask(with: url) { [weak self] (data, _, _) in

            guard let data = data else {
                DispatchQueue.main.async {
                    self?.activityIndicatorView.stopAnimating()
                }
                return
            }
            
            let image = UIImage(data: data)?.resizedImage(with: CGSize(width: 177, height: 100))
            
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                    if self?.imageView.image == nil {
                        self?.imageView.alpha = 0
                    }
                }, completion: {_ in
                    self?.activityIndicatorView.stopAnimating()
                    self?.imageView.image = image
                    UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                        self?.imageView.alpha = 1.0
                    }, completion: nil)
                })
            }
            
        }
        
        dataTask.resume()
        
        self.dataTask = dataTask
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        dataTask?.cancel()
        imageView.image = nil
    }
    
}
