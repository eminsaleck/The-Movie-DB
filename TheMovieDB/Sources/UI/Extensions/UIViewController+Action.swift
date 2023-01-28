//
//  File.swift
//  
//
//  Created by LEMIN DAHOVICH on 28.01.2023.
//

import UIKit

public extension UIViewController {
    
    func showSimpleActionSheet(title: String?, message: String?, action: UIAlertAction) {
        let actionSheet = UIAlertController(title: title,
                                            message: message,
                                            preferredStyle: .actionSheet)

        let cancelTitle = Localized.accountAlertCancel.localized()
        let cancelActionButton = UIAlertAction(title: cancelTitle, style: .cancel) { _ in
            self.dismiss(animated: true)
        }
        actionSheet.addAction(cancelActionButton)

        actionSheet.addAction(action)
        present(actionSheet, animated: true, completion: nil)
    }
}
