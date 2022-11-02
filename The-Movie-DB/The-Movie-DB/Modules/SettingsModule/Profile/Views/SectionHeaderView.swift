//
//  SectionHeaderView.swift
//  TabBarApp
//
//  Created by Greg Delgado on 9/25/19.
//  Copyright © 2019 greg. All rights reserved.
//

import UIKit

class SectionHeaderView: UIView {
    var title: String?
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = Theme.sectionHeaderFont
        return label
    }()
    let buttonSize: CGFloat = 30.0
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.backgroundColor = .black
        button.tintColor = UIColor.white
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = buttonSize / 2.0
        button.layer.masksToBounds = true
        return button
    }()
    
    init(title: String?) {
        self.title = title
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        backgroundColor = Theme.sectionHeaderBackgroundColor
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
            titleLabel.leftAnchor.constraint(equalTo: leadingAnchor, constant: 8.0),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8.0),
            button.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
            button.leadingAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 8.0),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.0),
            button.centerYAnchor.constraint(equalTo: centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: buttonSize),
            button.widthAnchor.constraint(equalToConstant: buttonSize)
        ])
        
        
    }
}
