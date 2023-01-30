//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 28.01.2023.
//

import UI
import UIKit

final class PlainCell: UITableViewCell {
    let identifier = "PlainCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configTitle(with title: String?) {
        label.text = title
    }
    
    private func configUI() {
        backgroundColor = .secondarySystemBackground
        constrained()
    }
    
    private func constrained() {
        contentView.addSubview(label)
        accessoryType = .disclosureIndicator
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
