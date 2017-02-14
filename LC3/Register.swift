//
//  Register.swift
//  LC3
//
//  Created by Cem Gokmen on 2/13/17.
//  Copyright © 2017 Cem Gokmen. All rights reserved.
//

import Foundation

func expo(_ base: Int, _ power: Int) -> Int {
    var base = base
    var power = power
    
    var result = 1
    
    while (power != 0){
        if (power%2 == 1){
            result *= base
        }
        power /= 2
        base *= base
    }
    return result
}

class Register {
    public var value : UInt16
    
    init(zero: Bool) {
        if zero {
            value = 0
        } else {
            value = UInt16(arc4random_uniform(UInt32(expo(2, 16))))
        }
    }
    
    func setValue(value: UInt16) -> Void {
        self.value = value
    }
    
    func getValue() -> UInt16 {
        return self.value
    }
}
