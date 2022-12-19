//
//  UIView+ToastUtils.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit

extension UIView {

    func showSuccessToast(withMessage message: String, completion: ((Bool) -> Void)? = nil) {
        showToast(withMessage: message, defaultConfiguration: .success, completion: completion)
    }

    func showFailureToast(withMessage message: String, completion: ((Bool) -> Void)? = nil) {
        showToast(withMessage: message, defaultConfiguration: .failure, completion: completion)
    }

}
