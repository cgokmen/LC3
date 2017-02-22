//
//  TRAP.swift
//  LC3
//
//  Created by Cem Gokmen on 2/13/17.
//  Copyright © 2017 Cem Gokmen. All rights reserved.
//

import Foundation

class TRAPInstruction: Instruction {
    override class func run(computer: LC3, instruction: UInt16) -> Void {
        let pc = computer.programCounter.getValue()
        computer.getRegister(address: 7).setValue(pc)

        let vector = instruction & 0xFF // 8 bits

        // We have fake traps for the default ones.
        switch (vector) {
            case 0x20:
                // TODO: GETC
                break
            case 0x21:
                // TODO: OUT
                break
            case 0x22:
                // TODO: PUTS
                break
            case 0x23:
                // TODO: IN
                break
            case 0x25:
                // HALT
                computer.halted = true
                break
            default:
                computer.programCounter.setValue(vector)
                break
        }
    }
}
