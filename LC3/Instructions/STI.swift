//
//  STI.swift
//  LC3
//
//  Created by Cem Gokmen on 2/13/17.
//  Copyright © 2017 Cem Gokmen. All rights reserved.
//

import Foundation

class STIInstruction: Instruction {
    override class func run(computer: LC3, instruction: UInt16) -> Void {
        let sourceRegister = UInt8((instruction >> 9) & 0x7) // 3 bits
        let pcOffset = Util.signExtend(instruction & 0x1FF, fromBit: 8) // 9 bits
        let destinationAddressAddress = UInt16(bitPattern: Int16(bitPattern: computer.programCounter.getValue()) &+ pcOffset)

        let destinationAddress = computer.memory.getValue(atAddress: destinationAddressAddress)

        let value = computer.getRegister(address: sourceRegister).getValue()
        computer.memory.setValue(atAddress: destinationAddress, value: value)
    }
}
