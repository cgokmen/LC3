//
//  Util.swift
//  LC3
//
//  Created by Cem Gokmen on 2/14/17.
//  Copyright © 2017 Cem Gokmen. All rights reserved.
//

import Foundation

class Util {
    static func expo(_ base: Int, _ power: Int) -> Int {
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

    static func bitMask(fromIncluding: Int, toExcluding: Int) -> Int {
        let ones = expo(2, fromIncluding - toExcluding + 1) - 1
        return ones << fromIncluding
    }
    
    static func signExtend(_ value: UInt16, fromBit: Int16) -> Int16 {
        let shift = 15 - fromBit
        
        return (Int16(bitPattern: value) << shift) >> shift
    }
}
