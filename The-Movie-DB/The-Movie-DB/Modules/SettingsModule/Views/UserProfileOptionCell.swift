//
//  UserProfileOptionCell.swift
//  TabBarApp
//
//  Created by Greg Delgado on 10/4/19.
//  Copyright © 2019 greg. All rights reserved.
//

import UIKit

class UserProfileOptionCell: UITableViewCell {
    static let userImageSize: CGFloat = 48.0
    
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = UserProfileOptionCell.userImageSize / 2.0
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Theme.primaryFontColor
        label.font = Theme.primaryFont
        label.numberOfLines = 1
        return label
    }()
    
    let secondaryLabel: UILabel = {
        let label = UILabel()
        label.textColor = Theme.secondaryFontColor
        label.font = Theme.secondaryFont
        label.numberOfLines = 1
        label.text = "View Account"
        return label
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 4.0
        stackView.distribution = .fill
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        contentView.backgroundColor = .white
        contentView.addSubview(userImageView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(secondaryLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16.0),
            userImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            userImageView.heightAnchor.constraint(equalToConstant: UserProfileOptionCell.userImageSize),
            userImageView.widthAnchor.constraint(equalToConstant: UserProfileOptionCell.userImageSize)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: userImageView.rightAnchor, constant: 16.0),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
        ])
    }
    
    func configure(with viewModel: ProfileViewModel) {
        userImageView.image = UIImage(named: viewModel.image)
        nameLabel.text = viewModel.description
    }
}
