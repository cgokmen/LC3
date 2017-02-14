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
    
    init() {
        memory = Memory()
        registers = []
        for _ in 0..<LC3.registerCount {
            registers.append(Register(zero: false))
        }
        
        programCounter = Register(zero: true)
        instructionRegister = Register(zero: true)
    }
    
    func tick() {
        let instruction : UInt16 = instructionRegister.getValue()
        
        Instruction.run(computer: self, instruction: instruction)
    }
}
