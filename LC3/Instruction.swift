//
//  Instruction.swift
//  LC3
//
//  Created by Cem Gokmen on 2/13/17.
//  Copyright © 2017 Cem Gokmen. All rights reserved.
//

import Foundation

class Instruction {
    static var opCodes : [UInt8: Instruction.Type] = [
        0x0: BRInstruction.self,
        0x1: ADDInstruction.self,
        0x2: LDInstruction.self,
        0x3: STInstruction.self,
        0x4: JSRInstruction.self,
        0x5: ANDInstruction.self,
        0x6: LDRInstruction.self,
        0x7: STRInstruction.self,
        0x8: RTIInstruction.self,
        0x9: NOTInstruction.self,
        0xA: LDIInstruction.self,
        0xB: STIInstruction.self,
        0xC: RETInstruction.self,
      //0xD: RESERVED INSTRUCTION
        0xE: LEAInstruction.self,
        0xF: TRAPInstruction.self
    ]
    
    class func run(computer: LC3, instruction: UInt16) -> Void {
        var opCode : UInt8 = UInt8(instruction >> 12)
        opCodes[opCode].run(computer, instruction)
    }
}
