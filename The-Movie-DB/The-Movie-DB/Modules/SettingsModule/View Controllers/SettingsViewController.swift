//
//  SettingsViewController.swift
//  TabBarApp
//
//  Created by Greg Delgado on 10/4/19.
//  Copyright © 2019 greg. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
    
        return tableView
    }()
    
    var viewModel: SettingsViewModel
    
    var didSelectProfile: ((ProfileViewModel) -> Void)?
    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    func setup() {
        title = "Settings"
        setupTableView()
    }
    
    func setupTableView() {
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0.0),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -0.0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -0.0),
        ])
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: MenuOptionCell.reuseIdentifier)
        tableView.register(UserProfileOptionCell.self, forCellReuseIdentifier: UserProfileOptionCell.reuseIdentifier)
    }
}
extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let menuOption = viewModel.menuOption(for: indexPath)
        if let profileViewModel = menuOption as? ProfileViewModel {
            return profileCell(with: profileViewModel, at: indexPath)
        }
        return menuOptionCell(with: menuOption, at: indexPath)
    }
    
    func profileCell(with viewModel: ProfileViewModel, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserProfileOptionCell.reuseIdentifier, for: indexPath) as! UserProfileOptionCell
        cell.configure(with: viewModel)
        cell.selectionStyle = .none
        return cell
    }
    
    func menuOptionCell(with viewModel: MenuOption, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuOptionCell.reuseIdentifier, for: indexPath) as! MenuOptionCell
        cell.configure(with: viewModel)
        cell.selectionStyle = .none
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

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if numberOfSections(in: tableView) == 2 && indexPath.section == 0 && indexPath.row == 0 {
            return 72.0
        }
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let menuOption = viewModel.menuOption(for: indexPath)
        if let profileViewModel = menuOption as? ProfileViewModel {
            didSelectProfile?(profileViewModel)
        }
    }
}
