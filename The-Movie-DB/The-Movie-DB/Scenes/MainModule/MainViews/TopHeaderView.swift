//
//  File.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 09.11.2022.
//

import UIKit

final class TopHeaderView: UICollectionReusableView {
    static let reuseIdentifier = "top-header-reuse-identifier"
    
    private let playButton: UIButton = {
        $0.setTitle("Play", for: .normal)
        $0.layer.borderColor = UIColor.white.cgColor
        $0.layer.borderWidth = 0.6
        $0.layer.cornerRadius = 5
        $0.titleLabel?.font = .systemFont(ofSize: 15)
        return $0
    }(UIButton())
    
    private let saveButton: UIButton = {
        $0.setTitle("Save", for: .normal)
        $0.layer.borderColor = UIColor.white.cgColor
        $0.layer.borderWidth = 0.6
        $0.layer.cornerRadius = 5
        $0.titleLabel?.font = .systemFont(ofSize: 15)
        return $0
    }(UIButton())
    
    private let buttonStack: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    private let imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.backgroundColor = .white
        $0.image = UIImage(named: "heroImage")
        return $0
    }(UIImageView())
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addGradient()
        setupButtons()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension TopHeaderView {
    private func setupButtons(){
      let spacerView = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
        buttonStack.addArrangedSubview(playButton)
        buttonStack.addArrangedSubview(spacerView)
        buttonStack.addArrangedSubview(saveButton)
        imageView.addSubview(buttonStack)

        NSLayoutConstraint.activate([
            playButton.heightAnchor.constraint(equalToConstant: 32),
            playButton.widthAnchor.constraint(equalToConstant: 50),
            
            saveButton.heightAnchor.constraint(equalToConstant: 32),
            saveButton.widthAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    private func addGradient(){
        let gradientView = GradientView(frame: imageView.bounds)
        imageView.addSubview(gradientView)
    }
    
    private func setup() {
        self.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addSubview(label)
        addSubview(imageView)

        playButton.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.font = UIFont.boldSystemFont(ofSize: 20)

        
        let inset = CGFloat(10)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset - 10),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset),
            imageView.heightAnchor.constraint(equalToConstant: 500),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -20),
            
            buttonStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonStack.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10)
        ])
        
    }
}


