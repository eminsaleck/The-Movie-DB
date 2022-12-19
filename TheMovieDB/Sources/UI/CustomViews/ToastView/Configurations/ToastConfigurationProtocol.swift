//
//  ToastConfigurationProtocol.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit

protocol ToastConfigurationProtocol {

    var backgroundColor: UIColor { get }
    var borderColor: UIColor { get }
    var borderWidth: CGFloat { get }

    var titleInsets: UIEdgeInsets { get }
    var titleTextColor: UIColor { get }
    var titleTextAlignment: NSTextAlignment { get }

    var cornerRadius: CGFloat { get }
    var animationDuration: TimeInterval { get }

    var dismissDuration: TimeInterval { get }

}
