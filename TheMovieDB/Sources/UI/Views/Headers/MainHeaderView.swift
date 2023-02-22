//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 22.02.2023.
//

import UIKit

public class MainHeaderView: UICollectionReusableView {
    let genreLabel: UILabel = {
        $0.textColor = .black
        $0.adjustsFontForContentSizeCategory = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.preferredFont(forTextStyle: .title3)
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.text = ""
        return $0
    }(UILabel())
    
    let button: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle(Localized.all.localized(), for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .light)
        $0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return $0
    }(UIButton())
    
    public var buttonTapHandler: ((_ id: Int) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupUI()
    }
    
    public func setModel(genre: String?, id: Int?){
        genreLabel.text = genre
        button.tag = id ?? 0
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    private func setupHierarchy(){
        addSubview(genreLabel)
        addSubview(button)
    }
    
    @objc private func buttonTapped() {
        buttonTapHandler?(button.tag)
    }
}

extension MainHeaderView {
    private func setupUI() {
        let inset = CGFloat(10)
        NSLayoutConstraint.activate([
            genreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset - 10),
            genreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            genreLabel.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            genreLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset),
            
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.centerYAnchor.constraint(equalTo: genreLabel.centerYAnchor)
        ])
    }
    
}
