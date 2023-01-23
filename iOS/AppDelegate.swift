//
//  AppDelegate.swift
//  Matching game
//
//  Created by LEMIN DAHOVICH on 12.09.2022.
//


import UIKit
import AppFeature

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let container = DIContainer(appConfigurations: AppConfigurations())
    var coordinator: MainCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureGlobalAppearanceIfNeeded()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = MainCoordinator(window: window!, container: container)
        coordinator?.start()
        
        return true
    }
    
    func configureGlobalAppearanceIfNeeded() {
        if #available(iOS 15, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBar.appearance().standardAppearance
            
            let tabBarAppearance = UITabBarAppearance()
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = UITabBar.appearance().standardAppearance
        }
    }
}

