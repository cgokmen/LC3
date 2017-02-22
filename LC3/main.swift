//
//  main.swift
//  LC3
//
//  Created by Cem Gokmen on 2/13/17.
//  Copyright © 2017 Cem Gokmen. All rights reserved.
//

import Foundation

var computer : LC3 = LC3()

let url = URL(fileURLWithPath: "/Users/cgokmen/Developer/Temp/sumtorial.obj")
try ObjLoader.loadFromURL(url: url, memory: computer.memory)

let input : UInt16 = 9
print("Finding the sumtorial of " + String(input))

computer.memory.setValue(atAddress: 0x3008, value: input)

while (!computer.halted) {
    computer.tick()
}

// Read 3008 == 15
print("Result: " + String(computer.memory.getValue(atAddress: 0x3008)))