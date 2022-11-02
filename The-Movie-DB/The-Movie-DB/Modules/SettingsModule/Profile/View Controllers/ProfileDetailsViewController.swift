//
//  ProfileDetailsViewController.swift
//  TabBarApp
//
//  Created by Greg Delgado on 9/25/19.
//  Copyright © 2019 greg. All rights reserved.
//

import UIKit

class ProfileDetailsViewController: UIViewController {

    var tableView: UITableView!
    
    let viewModel: ProfileDetailsViewModel
    
    init(viewModel: ProfileDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        tableView = UITableView()
        view.addSubview(tableView)
        tableView.contentInset = UIEdgeInsets(top: 44.0, left: 0, bottom: 0, right: 0)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -0.0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -0.0),
        ])
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
        tableView.register(DetailCell.self, forCellReuseIdentifier: DetailCell.reuseIdentifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension ProfileDetailsViewController: UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.reuseIdentifier, for: indexPath) as! DetailCell
        let data = viewModel.rowData(at: indexPath)
        cell.primaryLabel.text = data.title
        cell.valueTextfield.text = data.value
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title = viewModel.headerTitle(for: section)
        return headerView(title: title)
    }
    
    func headerView(title: String?) -> UIView {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13.0)
        label.textColor = UIColor.white
        label.text = title?.uppercased()
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        let OFFSET:CGFloat = 8.0
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: OFFSET),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: OFFSET),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -OFFSET),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -OFFSET),
        ])
        
        return view
    }
    
}
