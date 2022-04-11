//
// Copyright © 2022 An Tran. All rights reserved.
//

import Combine
import Foundation
import RealFlags
import SwiftUI
import TweakPane

public struct RealFlagsBlade: Blade {
    public var name: String? = "Feature Flags"
    
    private let navViewController: () -> UINavigationController?
    private let flagsManager: FlagsManager
    
    public init(
        flagsManager: FlagsManager,
        navViewController: @autoclosure @escaping () -> UINavigationController?
    ) {
        self.flagsManager = flagsManager
        self.navViewController = navViewController
    }
    
    public func render() -> AnyView {
        AnyView(ContentView(
            flagsManager: flagsManager,
            action: { navViewController()?.pushViewController($0, animated: true) }
        ))
    }
}

private struct ContentView: View {
    
    let flagsManager: FlagsManager
    let action: (UIViewController) -> Void
    
    var body: some View {
        VStack {
            Button(
                action: {
                    action(FlagsBrowserController.create(manager: flagsManager).topViewController!)
                },
                label: {
                    Text("Show Flags Browser")
                }
            )
        }
    }
}
