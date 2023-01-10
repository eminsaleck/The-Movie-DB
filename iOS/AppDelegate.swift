//
//  AppDelegate.swift
//  Matching game
//
//  Created by LEMIN DAHOVICH on 12.09.2022.
//


import UIKit
import Handlers
import SplashFeature
import DependencyInjection

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationHandler: NavigationHandlerProtocol?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        _ = DIContainer.shared

       navigationHandler = DIContainer.shared.resolve()

        configureGlobalAppearanceIfNeeded()

        // We configure the remote data source with the API key and the read access token
        let baseConfiguration: BaseConfiguration = PropertyListHelper.decode()
        let remoteDataSource: RemoteDataSourceProtocol = DIContainer.shared.resolve()
        remoteDataSource.configure(with: baseConfiguration.keys.apiKey,
                                   readAccessToken: baseConfiguration.keys.readAccessToken)

        window?.rootViewController = SplashBuilder.buildViewController()

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

