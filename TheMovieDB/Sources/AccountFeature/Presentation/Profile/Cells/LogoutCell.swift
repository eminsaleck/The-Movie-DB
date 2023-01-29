//
//  File.swift
//
//
//  Created by LEMIN DAHOVICH on 28.01.2023.
//

import UIKit
import UI

class LogoutCell: UITableViewCell {

    let identifier = "LogoutTableViewCell"
    
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  private func setupUI() {
    backgroundColor = .secondarySystemBackground
    textLabel?.text = Localized.accountLogout.localized()
    textLabel?.textAlignment = .center
    textLabel?.textColor = .red
  }
}
