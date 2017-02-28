//
//  LDR.swift
//  LC3
//
//  Created by Cem Gokmen on 2/13/17.
//  Copyright © 2017 Cem Gokmen. All rights reserved.
//

import Foundation

class LoadBaseOffsetHandler: InstructionHandler {
    // Update the CC

    override func run(instruction: UInt16) -> Void {
        let destinationRegister = UInt8((instruction >> 9) & 0x7) // 3 bits
        let baseRegister = UInt8((instruction >> 6) & 0x7) // 3 bits
        let registerOffset = Util.signExtend(instruction & 0x3F, fromBit: 5) // 6 bits
        let sourceAddress = UInt16(bitPattern: Int16(bitPattern: computer.getRegister(address: baseRegister).getValue()) &+ registerOffset)

        let value = computer.memory.getValue(atAddress: sourceAddress)
        let register = computer.getRegister(address: destinationRegister)

        register.setValue(value)

        let cc = ConditionCodeEnum(data: value)
        computer.conditionCode = cc
    }
}
