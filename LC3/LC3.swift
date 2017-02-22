//
//  LC3.swift
//  LC3
//
//  Created by Cem Gokmen on 2/13/17.
//  Copyright © 2017 Cem Gokmen. All rights reserved.
//

import Foundation

class LC3 {
    static let registerCount = 8
    
    var memory : Memory
    var registers : [Register]
    
    var programCounter: Register
    var instructionRegister: Register
    
    var conditionCode : ConditionCodeEnum

    var halted : Bool
    
    init() {
        memory = Memory()
        registers = []
        for _ in 0..<LC3.registerCount {
            registers.append(Register(zero: false))
        }
        
        programCounter = Register(zero: true)
        instructionRegister = Register(zero: true)

        programCounter.setValue(0x3000)
        
        conditionCode = .Z

        halted = false
    }
    
    func tick() {
        let address = programCounter.getValue()
        instructionRegister.setValue(address) // Put the current instruction in the instruction register
        programCounter.setValue(address + 1) // Increment the PC

        let instruction = memory.getValue(atAddress: address)
        
        Instruction.run(computer: self, instruction: instruction)
    }
    
    func getRegister(address: UInt8) -> Register {
        let index = Int(exactly: address)
        return registers[index!]
    }
}
