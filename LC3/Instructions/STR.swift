//
//  STR.swift
//  LC3
//
//  Created by Cem Gokmen on 2/13/17.
//  Copyright © 2017 Cem Gokmen. All rights reserved.
//

import Foundation

class STRInstruction: Instruction {
    override class func run(computer: LC3, instruction: UInt16) -> Void {
        let sourceRegister = UInt8((instruction >> 9) & 0x7) // 3 bits
        let baseRegister = UInt8((instruction >> 6) & 0x7) // 3 bits
        let registerOffset = Util.signExtend(instruction & 0x3F, fromBit: 5) // 6 bits
        let destinationAddress = UInt16(bitPattern: Int16(bitPattern: computer.getRegister(address: baseRegister).getValue()) &+ registerOffset)

        let value = computer.getRegister(address: sourceRegister).getValue()
        computer.memory.setValue(atAddress: destinationAddress, value: value)
    }
}
