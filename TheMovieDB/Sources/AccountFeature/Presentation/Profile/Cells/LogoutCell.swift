//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 28.01.2023.
//

import UIKit
import UI

final class LogoutCell: UITableViewCell {
    
    let identifier = "LogoutTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        backgroundColor = .secondarySystemBackground
        textLabel?.text = Localized.accountLogout.localized()
        textLabel?.textAlignment = .center
        textLabel?.textColor = .red
    }
}
