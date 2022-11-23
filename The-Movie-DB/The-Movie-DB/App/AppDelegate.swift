//

//

import UIKit
import Data

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureAppearance()
        _ = DIContainer.shared
        
        let baseConfig: BaseConfig = PropertyListHelper.decode()
        let remoteDataSource: RemoteDataSourceProtocol = DIContainer.shared.resolve()
       // print("\(baseConfig)")
        remoteDataSource.configure(with: baseConfig.keys.apiKey,
                                   readAccessToken: baseConfig.keys.readAccessToken)
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let navigationController: UINavigationController = .init()

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        appCoordinator = AppCoordinator.init(navigationController)
        appCoordinator?.start()
                
        return true
    }
}

