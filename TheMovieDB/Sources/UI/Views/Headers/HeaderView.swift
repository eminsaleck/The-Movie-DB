//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 16.02.2023.
//

import UIKit

public class HeaderView: UICollectionReusableView {
    static let reuseIdentifier = "header"
    
    public let label = UILabel()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        label.text = Localized.popularTitle.localized()
        backgroundColor = .clear
    }
    
    public func setTitle(_ title: String){
        label.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension HeaderView {
    func configure() {
        backgroundColor = .systemBackground
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        
        let inset = CGFloat(10)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            label.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset)
        ])
        label.font = UIFont.preferredFont(forTextStyle: .title2)
    }
}
