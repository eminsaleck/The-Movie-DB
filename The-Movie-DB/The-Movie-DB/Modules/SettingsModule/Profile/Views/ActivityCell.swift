//
//  ActivityCell.swift
//  TabBarApp
//
//  Created by Greg Delgado on 10/2/19.
//  Copyright © 2019 greg. All rights reserved.
//

import UIKit

class ActivityCell: UITableViewCell {

    var primaryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = Theme.secondaryFont
        label.textColor = UIColor.gray
        return label
    }()
    
    var secondaryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = Theme.secondaryFont
        label.textColor = UIColor.gray
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
       super.init(coder: coder)
       setup()
    }
   
    private func setup() {
       contentView.backgroundColor = .white
       contentView.addSubview(primaryLabel)
       contentView.addSubview(secondaryLabel)
       setupConstraints()
    }
    
    private func setupConstraints() {
        primaryLabel.translatesAutoresizingMaskIntoConstraints = false
        secondaryLabel.translatesAutoresizingMaskIntoConstraints = false
        let HORIZONTAL_OFFSET: CGFloat = 12.0
        let VERTICAL_OFFSET: CGFloat = 12.0
        NSLayoutConstraint.activate([
            primaryLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: HORIZONTAL_OFFSET),
            primaryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: VERTICAL_OFFSET),
            primaryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -VERTICAL_OFFSET),
            secondaryLabel.leftAnchor.constraint(equalTo: primaryLabel.rightAnchor, constant: -HORIZONTAL_OFFSET),
            secondaryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: VERTICAL_OFFSET),
            secondaryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -VERTICAL_OFFSET),
            secondaryLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -HORIZONTAL_OFFSET),
        ])
        primaryLabel.setContentCompressionResistancePriority(UILayoutPriority.required, for: .horizontal)
        primaryLabel.setContentHuggingPriority(UILayoutPriority.required, for: .horizontal)
    }
    
    func configure(with viewModel: ActivityViewModel) {
        primaryLabel.text = viewModel.activityDescription
        secondaryLabel.text = viewModel.activityDate
    }
}
