//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 28.01.2023.
//

import UIKit
import Common
import UI

final class ProfileCell: UITableViewCell {
    let identifier = "ProfileTableViewCell"
    
    private let nameLabel = UILabel(frame: .zero)
    
    internal let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureData(with entity: Account) {
        nameLabel.text = Localized.accountGreetings.localized() + " \(entity.userName)!"
        
        guard let imagePath = entity.avatarURL else { return }
        profileImageView.loadImage(imagePath: imagePath)
    }
    
    private func setupUI() {
        backgroundColor = .secondarySystemBackground
        textAdjustment()
        constainted()
    }
    
    private func textAdjustment() {
        nameLabel.font = .systemFont(ofSize: 15)
        nameLabel.textAlignment  = .center
    }

    
    private func constainted() {
        addSubview(nameLabel)
        addSubview(profileImageView)
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            nameLabel.bottomAnchor.constraint(equalTo: profileImageView.topAnchor, constant: -10),
            
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor, multiplier: 1)
        ])
    }
    
}
