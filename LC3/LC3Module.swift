//
// Created by Cem Gokmen on 2/28/17.
// Copyright (c) 2017 Cem Gokmen. All rights reserved.
//

import Foundation

enum LC3ModuleLoadError: Error {
    case couldNotEnableError
}

protocol LC3Module {
    func onEnable(computer: LC3) throws

    func onDisable(computer: LC3)
}
