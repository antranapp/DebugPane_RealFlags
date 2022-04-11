//
// Copyright © 2022 An Tran. All rights reserved.
//

import Combine
import DebugPane
import DebugPane_RealFlags
import RealFlags
import SwiftUI
import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    lazy var flagsManager: FlagsManager = {
        // Create the configuration to manage automatic feature flags key evaluation
        let config = KeyConfiguration(prefix: "app_", pathSeparator: "/", keyTransform: .snakeCase)
        
        // Instantiate our manager
        let manager = FlagsManager(
            providers: [LocalProvider()],
            keyConfiguration: config
        )
        
        return manager
    }()
    
    private var bag = Set<AnyCancellable>()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
    
        // Add flags from HomeFeature
        flagsManager.addCollection(HomeFeatureFlags.self)
        
        DebugPane.start {
            RealFlagsBlade(
                flagsManager: self.flagsManager,
                navViewController: DebugPane.navController
            )
        }

        return true
    }
}

extension UIApplication {
    static let flagsManager: FlagsManager = (UIApplication.shared.delegate as! AppDelegate).flagsManager
}
