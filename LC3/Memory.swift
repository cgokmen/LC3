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

        for _ in 0 ..< Util.expo(2, Memory.addressBits) {
            registers.append(Register(zero: true))
        }
    }
    
    func getValue(atAddress: UInt16) -> UInt16 {
        let index = Int(exactly: atAddress)
        return registers[index!].getValue()
    }

    func setValue(atAddress: UInt16, value: UInt16) {
        let index = Int(exactly: atAddress)
        registers[index!].setValue(value)
    }
}
