//
//  ConditionCounterEnum.swift
//  LC3
//
//  Created by Cem Gokmen on 2/13/17.
//  Copyright © 2017 Cem Gokmen. All rights reserved.
//

import Foundation

enum ConditionCodeEnum: UInt8 {
    case P = 0x1
    case Z = 0x2
    case N = 0x4
    
    init(data: UInt16) {
        let uData = Int16(bitPattern: data)
        
        if (uData > 0) {
            self = ConditionCodeEnum.P
        } else if (uData < 0) {
            self = ConditionCodeEnum.N
        } else {
            self = ConditionCodeEnum.Z
        }
    }
}
