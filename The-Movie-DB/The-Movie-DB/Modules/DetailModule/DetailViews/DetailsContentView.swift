//
//  DetailsContentView.swift
//  The Movie DB
//
//  Created by Anton Hoang on 08.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import UIKit
import YouTubeiOSPlayerHelper

final class DetailsContentView: UIView {
    
    private let titleLabel: UILabel = {
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.font = .boldSystemFont(ofSize: 22)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let taglineLabel: UILabel = {
        $0.textColor = .lightGray
        $0.numberOfLines = 0
        $0.font = .italicSystemFont(ofSize: 13)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let overviewLabel: UILabel = {
        $0.numberOfLines = 0
        $0.textColor = .lightGray
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 13)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let voteLabel: UILabel = {
        $0.numberOfLines = 0
        $0.textColor = .white
        $0.font = .preferredFont(forTextStyle: .body)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let starLabel: UIImageView = {
        $0.image = UIImage(named: "star")
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private  var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var yearView = InfoView()
    private var countryView = InfoView()
    private var durationView = InfoView()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    func setTrailer(key: String){
        print(key)
    }
    
    func setContent(info: Displayable?) {
        titleLabel.text = info?.titleName ?? ""
        overviewLabel.text = info?.review ?? ""
        voteLabel.text = String(info?.vote ?? 0.0)
        //Mock data
        setupRatingColor(info?.vote ?? 0.0)
        taglineLabel.text = "Love or die, lovely"
        yearView.configure(item: .year, value: "2022")
        countryView.configure(item: .country, value: "USA")
        durationView.configure(item: .duration, value: "122 m")
    }
    
    private func commonInit() {
        addSubview(titleLabel)
        addSubview(taglineLabel)
        addSubview(voteLabel)
        addSubview(stackView)
        addSubview(overviewLabel)
        addSubview(starLabel)
        setupStackView()
        setupConstraints()
    }
    
    private func setupRatingColor(_ vote: Double){
        if vote >= 7 {
            voteLabel.textColor = .systemGreen
        } else if vote >= 5 {
            voteLabel.textColor = #colorLiteral(red: 0.9981393218, green: 0.7549400926, blue: 0.03443264216, alpha: 1)
        } else if vote >= 3 {
            voteLabel.textColor = .systemOrange
        } else if vote < 3 {
            voteLabel.textColor = .systemRed
        }
      }
    
    private func setupStackView() {
        stackView.addArrangedSubview(yearView)
        stackView.addArrangedSubview(countryView)
        stackView.addArrangedSubview(durationView)
    }
}

//MARK: - Setup constraints
extension DetailsContentView{
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            taglineLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 17),
            taglineLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            voteLabel.topAnchor.constraint(equalTo: taglineLabel.bottomAnchor, constant: 17),
            voteLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            starLabel.trailingAnchor.constraint(equalTo: voteLabel.leadingAnchor, constant: -3),
            starLabel.centerYAnchor.constraint(equalTo: voteLabel.centerYAnchor),
            
            stackView.topAnchor.constraint(equalTo: voteLabel.bottomAnchor, constant: 5),
            stackView.bottomAnchor.constraint(equalTo: overviewLabel.topAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 70),
            stackView.widthAnchor.constraint(equalToConstant: 230),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            overviewLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            overviewLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            overviewLabel.widthAnchor.constraint(equalToConstant: 300),
            overviewLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
