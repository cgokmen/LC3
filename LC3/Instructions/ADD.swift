//
//  AddInstruction.swift
//  LC3
//
//  Created by Cem Gokmen on 2/13/17.
//  Copyright © 2017 Cem Gokmen. All rights reserved.
//

import Foundation

class AddHandler: InstructionHandler {
    // Update the CC
    
    override func run(instruction: UInt16) -> Void {
        let destinationRegister = UInt8((instruction >> 9) & 0x7) // 3 bits
        let sourceRegister1 = UInt8((instruction >> 6) & 0x7) // 3 bits
        let mode = (instruction >> 5) & 0x1 // 1 bit
        
        let term1 : Int16 = Int16(bitPattern: computer.getRegister(address: sourceRegister1).getValue())
        var term2 : Int16 = 0
        
        if mode == 0 {
            // Register mode
            let sourceRegister2 = UInt8(instruction & 0x7) // 3 bits
            term2 = Int16(bitPattern: computer.getRegister(address: sourceRegister2).getValue())
        } else {
            // Immediate addition mode
            term2 = Util.signExtend(instruction & 0x1F, fromBit: 4) // 5 bits
        }
        
        let total = UInt16(bitPattern: term1 &+ term2)
        computer.getRegister(address: destinationRegister).setValue(total)

        let cc = ConditionCodeEnum(data: total)
        computer.conditionCode = cc

        //print("Running ADD")
    }
}
