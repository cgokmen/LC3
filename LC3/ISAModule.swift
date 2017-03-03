//
// Created by Cem Gokmen on 2/28/17.
// Copyright (c) 2017 Cem Gokmen. All rights reserved.
//

import Foundation

class ISAModule : LC3Module {
    static var opCodes : [UInt8: InstructionHandler.Type] = [
            0x0: BranchHandler.self,
            0x1: AddHandler.self,
            0x2: LoadHandler.self,
            0x3: StoreHandler.self,
            0x4: JumpToSubroutineHandler.self,
            0x5: AndHandler.self,
            0x6: LoadBaseOffsetHandler.self,
            0x7: StoreBaseOffsetHandler.self,
            0x8: ReturnFromInterruptHandler.self,
            0x9: NotHandler.self,
            0xA: LoadIndirectHandler.self,
            0xB: StoreIndirectHandler.self,
            0xC: JumpReturnHandler.self,
            //0xD: RESERVED INSTRUCTION
            0xE: LoadEffectiveAddressHandler.self,
            0xF: TrapHandler.self
    ]

    override class func onEnable(computer: LC3) throws {
        for (code, handlerClass) in ISAModule.opCodes {
            let handler : InstructionHandler = handlerClass.init(computer: computer)

            do {
                try computer.addInstruction(opCode: code, instructionHandler: handler)
            } catch {
                // TODO: Undo the enable routine!
                throw LC3ModuleLoadError.couldNotEnableError
            }
        }
    }

    override class func onDisable(computer: LC3) {

    }
}
