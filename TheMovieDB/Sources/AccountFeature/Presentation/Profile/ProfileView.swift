//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 28.01.2023.
//

import UIKit
import Combine
import UI

final class ProfileView: UIView {
    
    private let viewModel: ProfileViewModelProtocol
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 40
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.contentInsetAdjustmentBehavior = .automatic
        tableView.tableFooterView = UIView()
        tableView.register(ProfileCell.self,
                           forCellReuseIdentifier: CellID.profileCell.id)
        tableView.register(PlainCell.self,
                           forCellReuseIdentifier: CellID.plainCell.id)
        tableView.register(LogoutCell.self,
                           forCellReuseIdentifier: CellID.logoutCell.id)
        return tableView
    }()
    
    typealias DataSource = UITableViewDiffableDataSource<ProfileSectionView, ProfilesSectionItem>
    typealias Snapshot = NSDiffableDataSourceSnapshot<ProfileSectionView, ProfilesSectionItem>
    
    private var dataSource: DataSource?
    private var bag = Set<AnyCancellable>()
    
    init(frame: CGRect = .zero, viewModel: ProfileViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        configUI()
        configDataSource()
        subscribe()
    }
    
    private func configUI() {
        tableView.delegate = self
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func subscribe() {
        viewModel
            .dataSource
            .map { dataSource -> Snapshot in
                var snapShot = Snapshot()
                for element in dataSource {
                    snapShot.appendSections([element.sectionView])
                    snapShot.appendItems(element.items, toSection: element.sectionView)
                }
                return snapShot
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] snapshot in
                self?.dataSource?.apply(snapshot)
            })
            .store(in: &bag)
    }
    
    private func configDataSource() {
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: {
            tableView, indexPath, model in
            
            switch model {
            case .userInfo(number: let accountInfo):
                let cell = tableView.dequeueReusableCell(withIdentifier: CellID.profileCell.id, for: indexPath) as! ProfileCell
                cell.configureData(with: accountInfo)
                return cell
                
            case .userLists(items: let title):
                let cell = tableView.dequeueReusableCell(withIdentifier: CellID.plainCell.id, for: indexPath) as! PlainCell
                cell.configTitle(with: title.localizedDescription)
                return cell
                
            case .logout(items: _):
                let cell = tableView.dequeueReusableCell(withIdentifier: CellID.logoutCell.id, for: indexPath) as! LogoutCell
                return cell
            }
        })
    }
}

extension ProfileView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(40)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = dataSource?.itemIdentifier(for: indexPath) {
            viewModel.chosen(cell: cell)
        }
    }
}
