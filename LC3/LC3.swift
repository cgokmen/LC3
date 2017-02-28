//
//  LC3.swift
//  LC3
//
//  Created by Cem Gokmen on 2/13/17.
//  Copyright © 2017 Cem Gokmen. All rights reserved.
//

import Foundation

enum LC3Error: Error {
    case couldNotBoot
    case instructionOverlap(opCode: UInt8, existingInstructionName: String)
}

class LC3 {
    static let registerCount = 8
    
    var memory : Memory
    var registers : [Register]
    
    var programCounter: Register
    var instructionRegister: Register
    
    var conditionCode : ConditionCodeEnum

    var modules : [LC3Module]
    var instructions : [UInt8: InstructionHandler]

    var halted : Bool
    
    init() throws {
        memory = Memory()
        registers = []
        for _ in 0..<LC3.registerCount {
            registers.append(Register(zero: false))
        }

        modules = []
        instructions = [:]

        programCounter = Register(zero: true)
        instructionRegister = Register(zero: true)
        programCounter.setValue(0x3000)
        conditionCode = .Z
        halted = false

        let isaModule = ISAModule()
        do {
            try isaModule.onEnable(computer: self)
        } catch {
            print("Could not load ISA")
            throw LC3Error.couldNotBoot
        }
        modules.append(isaModule)
    }
    
    func tick() {
        let address = programCounter.getValue()
        instructionRegister.setValue(address) // Put the current instruction in the instruction register
        programCounter.setValue(address + 1) // Increment the PC

        let instruction = memory.getValue(atAddress: address)

        let opCode : UInt8 = UInt8(instruction >> 12)
        let handler = instructions[opCode]

        if let handler = handler {
            handler.run(instruction: instruction)
        }
    }
    
    func getRegister(address: UInt8) -> Register {
        let index = Int(exactly: address)
        return registers[index!]
    }

    func addModule(module: LC3Module) {
        do {
            try module.onEnable(computer: self)
        } catch {
            print("Could not load module")
        }
        modules.append(module)
    }

    func addInstruction(opCode: UInt8, instructionHandler: InstructionHandler) throws {
        if (!instructions.keys.contains(opCode)) {
            instructions[opCode] = instructionHandler
        } else {
            let existingInstruction = instructions[opCode]!
            throw LC3Error.instructionOverlap(opCode: opCode, existingInstructionName: String(describing: type(of: existingInstruction)))
        }
    }
}
