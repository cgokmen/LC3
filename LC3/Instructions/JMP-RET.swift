//
//  JmpInstruction.swift
//  LC3
//
//  Created by Cem Gokmen on 2/13/17.
//  Copyright © 2017 Cem Gokmen. All rights reserved.
//

import Foundation

class JumpReturnHandler: InstructionHandler {
    override func run(instruction: UInt16) -> Void {
        let sourceRegister = UInt8((instruction >> 6) & 0x7) // 3 bits
        let destinationAddress = computer.getRegister(address: sourceRegister).getValue()
        computer.programCounter.setValue(destinationAddress)
    }
}
