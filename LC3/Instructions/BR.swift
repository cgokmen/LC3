//
//  BrInstruction.swift
//  LC3
//
//  Created by Cem Gokmen on 2/13/17.
//  Copyright © 2017 Cem Gokmen. All rights reserved.
//

import Foundation

class BranchHandler: InstructionHandler {
    override func run(instruction: UInt16) -> Void {
        let ccMask = UInt8((instruction >> 9) & 0x7) // 3 bits
        let cc : ConditionCodeEnum = computer.conditionCode

        //print("Running BR, CC is " + String(describing: cc))

        if cc.rawValue & ccMask != 0 {
            let pcOffset = Util.signExtend(instruction & 0x1FF, fromBit: 8) // 9 bits
            let destinationAddress = UInt16(bitPattern: Int16(bitPattern: computer.programCounter.getValue()) &+ pcOffset)

            computer.programCounter.setValue(destinationAddress)
        }
    }
}
