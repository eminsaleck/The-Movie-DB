//
//  Extension Anchor.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 20.10.2022.
//
import UIKit

extension UIView {
    
    func anchor(top : NSLayoutYAxisAnchor?, leading : NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, traling : NSLayoutXAxisAnchor?, padding : UIEdgeInsets = .zero, size : CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant : padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant : padding.left).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant : -padding.bottom).isActive = true
        }
        if let traling = traling {
            trailingAnchor.constraint(equalTo: traling, constant : -padding.right).isActive = true
        }
                        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
    }
    
}
