//
//  ProfileViewModel.swift
//  TabBarApp
//
//  Created by Greg Delgado on 10/4/19.
//  Copyright © 2019 greg. All rights reserved.
//

import Foundation
import UIKit

struct ProfileViewModel: MenuOption {

    var profile: Profile
    
    init(profile: Profile) {
        self.profile = profile
    }
    
    var imageURL: URL? {
        return nil
    }
    
    var image: String {
        return "avatar"
    }
    
    var description: String {
        return "\(profile.firstname ?? "") \(profile.lastname ?? "")".trimmingCharacters(in: .whitespaces)
    }
    
}


protocol ButtonAnimatable where Self: UIButton {
    func animateScaleOnPress()
}

extension ButtonAnimatable {
    func animateScaleOnPress() {
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { (_) in
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5.0, options: .curveEaseInOut, animations: {
                self.transform = CGAffineTransform.identity
            }) { (_) in
                
            }
        }
    }
}


protocol ReusableView: class {
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

extension UITableViewCell: ReusableView { }
extension UICollectionViewCell: ReusableView { }
