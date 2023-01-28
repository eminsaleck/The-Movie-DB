//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 28.01.2023.
//

import UIKit
import Common
import UI

class ProfileCell: UITableViewCell {
    let identifier = "ProfileTableViewCell"
    
  private let nameLabel = UILabel(frame: .zero)

  private let avatarImageView: UIImageView = {
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
    
  func setModel(with entity: Account) {
    nameLabel.text = Localized.accountGreetings.localized() + " \(entity.userName)!"
    avatarImageView.setImage(with: entity.avatarURL)
  }

  private func setupUI() {
    backgroundColor = .secondarySystemBackground
    constructHierarchy()
    activateConstraints()
    setupViews()
  }

  private func setupViews() {
    nameLabel.font = .app_title3().bolded
    nameLabel.textAlignment  = .center
  }

  private func constructHierarchy() {
    addSubview(nameLabel)
    addSubview(avatarImageView)
  }

  private func activateConstraints() {
    activateConstraintsForTitleLabel()
    activateConstraintsForImage()
  }

  private func activateConstraintsForTitleLabel() {
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
      nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
      nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
      nameLabel.bottomAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: -10)
    ])
  }

  private func activateConstraintsForImage() {
    avatarImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      avatarImageView.widthAnchor.constraint(equalToConstant: 100),
      avatarImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
      avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor, multiplier: 1)
    ])
  }
}
