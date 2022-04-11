//
// Copyright © 2022 An Tran. All rights reserved.
//

import Foundation
import RealFlags

struct HomeFeatureFlags: FlagCollectionProtocol {
    
    @Flag(default: true, description: "Show a secret feature in Home")
    var showSecretFeature: Bool
}

extension FlagsManager {
    var homeFlags: FlagsLoader<HomeFeatureFlags> {
        self.loader(forType: HomeFeatureFlags.self) ?? self.addCollection(HomeFeatureFlags.self)
    }
}
