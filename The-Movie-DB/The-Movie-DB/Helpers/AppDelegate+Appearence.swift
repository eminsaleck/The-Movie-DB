//
//  AppDelegate+Appearence.swift
//  The-Movie-DB
//
//  Created by LEMIN DAHOVICH on 19.11.2022.
//


import UIKit

extension AppDelegate {
    
    func configureAppearance() {
        // Override point for customization after application launch.
        let navigationBarAppearace = UINavigationBar.appearance()

        navigationBarAppearace.tintColor = .white
        navigationBarAppearace.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationBarAppearace.titleTextAttributes
        = [.foregroundColor : UIColor.white, .font: UIFont(name: "AppleSDGothicNeo-Bold", size: 24)!]
        
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor : UIColor.white], for: .selected)
        
    }
}
