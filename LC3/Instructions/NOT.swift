//
//  NOT.swift
//  LC3
//
//  Created by Cem Gokmen on 2/13/17.
//  Copyright © 2017 Cem Gokmen. All rights reserved.
//

import Foundation

class NOTInstruction: Instruction {
    // Update the CC

    override class func run(computer: LC3, instruction: UInt16) -> Void {
        let destinationRegister = UInt8((instruction >> 9) & 0x7) // 3 bits
        let sourceRegister = UInt8((instruction >> 6) & 0x7) // 3 bits

        let value = ~(computer.getRegister(address: sourceRegister).getValue())

        computer.getRegister(address: destinationRegister).setValue(value)

        let cc = ConditionCodeEnum(data: value)
        computer.conditionCode = cc
    }
}
