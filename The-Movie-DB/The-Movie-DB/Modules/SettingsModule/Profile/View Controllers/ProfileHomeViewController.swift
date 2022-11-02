//
//  ProfileHomeViewController.swift
//  TabBarApp
//
//  Created by Greg Delgado on 9/24/19.
//  Copyright © 2019 greg. All rights reserved.
//

import UIKit

class ProfileHomeViewController: UIViewController {
    
    var profileHeader: ProfileHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        navigationItem.title = "PROFILE"
        
        setupProfileHeader()
        setupPagerController()
    }
    
    func setupPagerController() {
        let pageViewController = ProfilePagerViewController()
        addChild(pageViewController)
        let pageControllerView = pageViewController.view!
        view.addSubview(pageControllerView)
        pageControllerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControllerView.topAnchor.constraint(equalTo: profileHeader.bottomAnchor),
            pageControllerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            pageControllerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            pageControllerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupProfileHeader() {
        profileHeader = ProfileHeaderView()
        view.addSubview(profileHeader)
        profileHeader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeader.leftAnchor.constraint(equalTo: view.leftAnchor),
            profileHeader.rightAnchor.constraint(equalTo: view.rightAnchor),
            profileHeader.heightAnchor.constraint(equalToConstant: view.bounds.width * 0.6),
        ])
    }
}
