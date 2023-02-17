//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 17.02.2023.
//

import UIKit
import Common
import UI

class RecentsCell: UICollectionViewCell {
    
    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setModel(with text: String) {
        label.text = text
    }

    private func setupUI() {
        backgroundColor = .secondarySystemBackground
        contentView.addSubview(label)
        activateConstraintsForLabel()
    }

    private func activateConstraintsForLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: -8),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
