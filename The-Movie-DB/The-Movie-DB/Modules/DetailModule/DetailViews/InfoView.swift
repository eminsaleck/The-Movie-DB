//
//  infoView.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 04.11.2022.
//

import UIKit

final class InfoView: UIView {
    
    private let descriptionLabel: UILabel = {
        $0.textColor = .lightGray
        $0.numberOfLines = 0
        $0.font = .boldSystemFont(ofSize: 10)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let infoLabel: UILabel = {
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.font = .boldSystemFont(ofSize: 16)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(item: InfoType, value: String){
        descriptionLabel.text = item.rawValue
        infoLabel.text = value
    }
    
    func commonInit(){
        addSubview(descriptionLabel)
        addSubview(infoLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            infoLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            infoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            infoLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
