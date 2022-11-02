//
//  AppDelegate.swift
//  TabBarController+Coordinator
//
//  Created by Vitalii Zaitcev on 6/18/20.
//  Copyright © 2020 Vitalii Zaitcev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let navigationBarAppearace = UINavigationBar.appearance()

        navigationBarAppearace.tintColor = .white
        navigationBarAppearace.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationBarAppearace.titleTextAttributes = [.foregroundColor : UIColor.white, .font: UIFont(name: "AppleSDGothicNeo-Bold", size: 24)!]
        
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor : UIColor.white], for: .selected)
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let navigationController: UINavigationController = .init()

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        appCoordinator = AppCoordinator.init(navigationController)
        appCoordinator?.start()
                
        return true
    }
}

