//
// Created by Cem Gokmen on 2/28/17.
// Copyright (c) 2017 Cem Gokmen. All rights reserved.
//

import Foundation

enum LC3ModuleLoadError: Error {
    case couldNotEnableError
}

class LC3Module {
    class func onEnable(computer: LC3) throws {
        return
    }

    class func onDisable(computer: LC3) {
        return
    }
}
