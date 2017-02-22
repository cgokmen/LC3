//
//  Register.swift
//  LC3
//
//  Created by Cem Gokmen on 2/13/17.
//  Copyright © 2017 Cem Gokmen. All rights reserved.
//

import Foundation

class Register {
    public var value : UInt16
    
    init(zero: Bool) {
        if zero {
            value = 0
        } else {
            value = UInt16(arc4random_uniform(UInt32(Util.expo(2, 16))))
        }
    }
    
    func setValue(_ value: UInt16) -> Void {
        self.value = value
    }
    
    func getValue() -> UInt16 {
        return self.value
    }
}
