//
//  ColorPalette.swift
//  UpcomingMovies
//
//  Created by LEMIN DAHOVICH on 19.12.2022.
//

import UIKit

extension UIColor {

    convenience init(withIntRed red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let maxColorValue: CGFloat = 255

        let floatRed = red / maxColorValue
        let floatGreen = green / maxColorValue
        let floatBlue = blue / maxColorValue

        self.init(red: floatRed, green: floatGreen, blue: floatBlue, alpha: alpha)
    }

}

public struct ColorPalette {

    public static let lightBlueColor = UIColor(withIntRed: 74, green: 144, blue: 226, alpha: 1)
    public static let darkBlueColor = UIColor(withIntRed: 0, green: 101, blue: 163, alpha: 1)
    public static let lightGrayColor = UIColor(withIntRed: 205, green: 205, blue: 205, alpha: 1)
    public static let redColor = UIColor(withIntRed: 255, green: 94, blue: 112, alpha: 1)
    public static let grayColor = UIColor(withIntRed: 130, green: 130, blue: 130, alpha: 1)
    public static let whiteColor = UIColor(white: 249 / 255, alpha: 1)
    public static let blackColor = UIColor(white: 40 / 255, alpha: 1)
    public static let darkGrayColor = UIColor.darkGray
    public static let regularGray = UIColor.systemGray

    public static var defaultBackgroundColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.systemBackground
        } else {
            return whiteColor
        }
    }

    public static var defaultGrayBackgroundColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.systemGray6
        } else {
            return .lightGray
        }
    }

    public static var navigationBarBackgroundColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.systemBackground
        } else {
            return whiteColor
        }
    }

    public static var groupedCellBackgroundColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.secondarySystemGroupedBackground
        } else {
            return whiteColor
        }
    }

    public struct Label {
        public static var defaultColor: UIColor {
            if #available(iOS 13.0, *) {
                return UIColor.label
            } else {
                return ColorPalette.blackColor
            }
        }
    }

}
