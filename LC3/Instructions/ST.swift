//
//  ST.swift
//  LC3
//
//  Created by Cem Gokmen on 2/13/17.
//  Copyright © 2017 Cem Gokmen. All rights reserved.
//

import Foundation

class StoreHandler: InstructionHandler {
    override func run(instruction: UInt16) -> Void {
        let sourceRegister = UInt8((instruction >> 9) & 0x7) // 3 bits
        let pcOffset = Util.signExtend(instruction & 0x1FF, fromBit: 8) // 9 bits
        let destinationAddress = UInt16(bitPattern: Int16(bitPattern: computer.programCounter.getValue()) &+ pcOffset)

        let value = computer.getRegister(address: sourceRegister).getValue()
        computer.memory.setValue(atAddress: destinationAddress, value: value)

        //print("Running ST")
    }
}
