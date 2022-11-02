//
//  MenuOptionCell.swift
//  TabBarApp
//
//  Created by Greg Delgado on 10/4/19.
//  Copyright © 2019 greg. All rights reserved.
//

import UIKit

class MenuOptionCell: UITableViewCell {
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(iconImageView)
        contentView.addSubview(descriptionLabel)
        
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor ).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor ).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 16).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 16).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with menuOption: MenuOption) {
        descriptionLabel.text = menuOption.description
        iconImageView.image = UIImage(named: menuOption.image)?.withRenderingMode(.alwaysTemplate)
    }
}
