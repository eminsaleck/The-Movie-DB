//
//  ProfileActivitiesViewController.swift
//  TabBarApp
//
//  Created by Greg Delgado on 10/2/19.
//  Copyright © 2019 greg. All rights reserved.
//

import UIKit

class ProfileActivitiesViewController: UIViewController {

    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
        tableView.backgroundColor = .white
        return tableView
    }()
    var viewModel: ProfileActivitiesViewModel!
    
    init(viewModel: ProfileActivitiesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        setupTableView()
        setupConstraints()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ActivityCell.self, forCellReuseIdentifier: ActivityCell.reuseIdentifier)
        view.addSubview(tableView)
    }
    func setupConstraints() {
        tableView.contentInset = UIEdgeInsets(top: 44.0, left: 0, bottom: 0, right: 0)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

}
extension ProfileActivitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ActivityCell.reuseIdentifier, for: indexPath) as! ActivityCell
        cell.configure(with: viewModel.viewModelForActivity(at: indexPath.row))
        return cell
    }
    
    
}

extension ProfileActivitiesViewController: UITableViewDelegate {
    
}
