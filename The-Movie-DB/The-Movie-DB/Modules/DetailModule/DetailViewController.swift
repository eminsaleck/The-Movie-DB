//
//  DetailViewController.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.10.2022.
//

import UIKit


class DetailViewController: UIViewController{
    
    var viewModel: DetailViewModelProtocol!
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.backgroundColor = .systemYellow
        titleLabel.layer.cornerRadius = 8.0
        return titleLabel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .brown
        view.addSubview(titleLabel)
        print(viewModel.movie!.title)
        
        titleLabel.text = viewModel.movie!.title
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    deinit {
        print("DetailViewController deinit")
    }
}

