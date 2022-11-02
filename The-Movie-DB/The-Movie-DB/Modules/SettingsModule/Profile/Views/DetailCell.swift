//
//  DetailCell.swift
//  TabBarApp
//
//  Created by Greg Delgado on 9/25/19.
//  Copyright © 2019 greg. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell { 
    var primaryLabel: UILabel = {
        let label = UILabel()
        label.font = Theme.primaryFont
        label.textColor = Theme.primaryFontColor
        return label
    }()
    
    var valueTextfield: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .right
        textField.font = Theme.secondaryFont
        textField.textColor = Theme.secondaryFontColor
        return textField
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var isSecureTextEntry = false {
        didSet {
            valueTextfield.isSecureTextEntry = isSecureTextEntry
        }
    }
    
    
    private func setupView() {
        selectionStyle = .none
    
        contentView.backgroundColor = .white
        contentView.addSubview(primaryLabel)
        contentView.addSubview(valueTextfield)
        setupConstraints()
    }
    
    private func setupConstraints() {
        let CONTENT_OFFSET: CGFloat = 12.0
        let VERTICAL_OFFSET: CGFloat = 16.0
        primaryLabel.translatesAutoresizingMaskIntoConstraints = false
        valueTextfield.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            primaryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: VERTICAL_OFFSET),
            primaryLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: CONTENT_OFFSET),
            primaryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -VERTICAL_OFFSET),
            
            valueTextfield.topAnchor.constraint(equalTo: contentView.topAnchor, constant: VERTICAL_OFFSET),
            valueTextfield.leftAnchor.constraint(equalTo: primaryLabel.rightAnchor, constant: CONTENT_OFFSET),
            valueTextfield.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -VERTICAL_OFFSET),
            valueTextfield.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -CONTENT_OFFSET)
        ])
        primaryLabel.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
    }
}
