//
//  Keyboardable.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit

protocol Keyboardable {}

extension Keyboardable where Self: UIViewController {

    @discardableResult
    func registerKeyboardWillShowNotification(using block: ((CGRect) -> Void)? = nil) -> NSObjectProtocol {
        let notificationName = UIResponder.keyboardWillShowNotification
        let notificationBlock: (Notification) -> Void = { notification in
            guard let userInfo = notification.userInfo,
                  let keyboardFrameValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
                return
            }
            let keyboardFrame = keyboardFrameValue.cgRectValue
            block?(keyboardFrame)
        }
        let notification = NotificationCenter.default.addObserver(forName: notificationName,
                                                                  object: nil, queue: nil,
                                                                  using: notificationBlock)
        return notification
    }

    @discardableResult
    func registerKeyboardWillHideNotification(using block: (() -> Void)? = nil) -> NSObjectProtocol {
        let notificationName = UIResponder.keyboardWillHideNotification
        let notification = NotificationCenter.default.addObserver(forName: notificationName,
                                                                  object: nil, queue: nil,
                                                                  using: { _  in block?() })
        return notification
    }

}
