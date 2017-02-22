//
//  JsrInstruction.swift
//  LC3
//
//  Created by Cem Gokmen on 2/13/17.
//  Copyright © 2017 Cem Gokmen. All rights reserved.
//

import Foundation

class JSRInstruction: Instruction {
    override class func run(computer: LC3, instruction: UInt16) -> Void {
        let pc = computer.programCounter.getValue()
        computer.getRegister(address: 7).setValue(pc)

        let mode = (instruction >> 11) & 0x1  // 1 bit

        if (mode == 0) {
            // JSRR
            let sourceRegister = UInt8((instruction >> 6) & 0x7) // 3 bits
            let destinationAddress = computer.getRegister(address: sourceRegister).getValue()

            computer.programCounter.setValue(destinationAddress)
        } else {
            // JSR
            let pcOffset = Util.signExtend(instruction & 0x7FF, fromBit: 10)
            let destinationAddress = UInt16(bitPattern: Int16(bitPattern: computer.programCounter.getValue()) &+ pcOffset)

            computer.programCounter.setValue(destinationAddress)
        }
    }
}
