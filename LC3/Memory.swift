//
//  Memory.swift
//  LC3
//
//  Created by Cem Gokmen on 2/13/17.
//  Copyright © 2017 Cem Gokmen. All rights reserved.
//

import Foundation

class Memory {
    static var addressBits : Int = 16
    private var registers : [Register]
    
    init() {
        registers = [Register]()
        // The function expo is in the Register file
        for _ in 0 ..< expo(2, Memory.addressBits) {
            registers.append(Register(zero: true))
        }
    }
    
    func getValue(atAddress: UInt8) {
        return registers[atAddress].getValue()
    }
}
