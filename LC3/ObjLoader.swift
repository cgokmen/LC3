//
// Created by Cem Gokmen on 2/22/17.
// Copyright (c) 2017 Cem Gokmen. All rights reserved.
//

import Foundation

class ObjLoader {
    static func loadFromURL(url: URL, memory: Memory) throws {
        let data = try Data(contentsOf: url, options: .alwaysMapped)

        var currentIndex = 0
        while (currentIndex < data.count) {
            var location : UInt16 = data.scanValue(start: currentIndex, length: 2)
            location = location.byteSwapped
            currentIndex += 2

            var length : UInt16 = data.scanValue(start: currentIndex, length: 2)
            length = length.byteSwapped
            currentIndex += 2

            for _ in 1...length {
                // Load 2 bytes
                var instruction : UInt16 = data.scanValue(start: currentIndex, length: 2)
                instruction = instruction.byteSwapped
                memory.setValue(atAddress: location, value: instruction)

                print(String(format:"x%2X: %2X", location, instruction))

                currentIndex += 2
                location += 1
            }
        }
    }
}

extension Data {
    func scanValue<T>(start: Int, length: Int) -> T {
        return self.subdata(in: start..<start+length).withUnsafeBytes { $0.pointee }
    }
}