//
//  LdiInstruction.swift
//  LC3
//
//  Created by Cem Gokmen on 2/13/17.
//  Copyright © 2017 Cem Gokmen. All rights reserved.
//

import Foundation

class LoadIndirectHandler: InstructionHandler {
    // Update the CC
    
    override func run(instruction: UInt16) -> Void {
        let destinationRegister = UInt8((instruction >> 9) & 0x7) // 3 bits
        let pcOffset = Util.signExtend(instruction & 0x1FF, fromBit: 8) // 9 bits
        let sourceAddressAddress = UInt16(bitPattern: Int16(bitPattern: computer.programCounter.getValue()) &+ pcOffset)

        let sourceAddress = computer.memory.getValue(atAddress: sourceAddressAddress)
        let value = computer.memory.getValue(atAddress: sourceAddress)
        let register = computer.getRegister(address: destinationRegister)

        register.setValue(value)

        let cc = ConditionCodeEnum(data: value)
        computer.conditionCode = cc
    }
}
