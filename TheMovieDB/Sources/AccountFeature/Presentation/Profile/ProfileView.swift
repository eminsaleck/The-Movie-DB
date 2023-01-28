//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 28.01.2023.
//

import UIKit
import Combine
import UI

final class ProfileRootView: UIView {
    
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
        setupUI()
        setupDataSource()
        subscribe()
    }
    
    private func setupUI() {
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
    
    private func setupDataSource() {
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { [weak self] tableView, indexPath, model in
            
            switch model {
            case .userInfo(number: let accountInfo):
                return self?.profileCell(tableView, at: indexPath, element: accountInfo)
                
            case .userLists(items: let title):
                return self?.listsCell(tableView, at: indexPath, element: title)
                
            case .logout(items: let title):
                return self?.logoutCell(tableView, at: indexPath, element: title)
            }
        })
    }
    
    private func profileCell(_ tableView: UITableView, at indexPath: IndexPath, element: Account) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.profileCell.id, for: indexPath)
        cell.setModel(with: element)
        return cell
    }
    
    private func listsCell(_ tableView: UITableView, at indexPath: IndexPath, element: UserListType) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.plainCell.id, for: indexPath)
        cell.setTitle(with: element.localizedDescription)
        return cell
    }
    private func logoutCell(_ tableView: UITableView, at indexPath: IndexPath, element: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID.logoutCell.id, for: indexPath)
        return cell
    }
}

extension ProfileRootView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(40)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let model = dataSource?.itemIdentifier(for: indexPath) {
            viewModel.didCellTap(model: model)
        }
    }
}


enum CellID{
    case plainCell
    case profileCell
    case logoutCell
    
    var id: String {
        switch self {
        case  .plainCell:
            return "PlainCell"
        case  .profileCell:
            return "ProfileTableViewCell"
        case  .logoutCell:
            return "LogoutTableViewCell"
        }
    }
}
