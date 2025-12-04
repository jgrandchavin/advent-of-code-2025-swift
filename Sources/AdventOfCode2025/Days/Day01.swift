//
//  Day01.swift
//  AdventOfCode2025
//
//  Created by Ju on 03/12/2025.
//

import Foundation

struct Day01 {
    static func run() {
        print("Running Day 1...")

        // MARK: Parse the input file

        var fileContent: String

        do {
            fileContent = try FileParser.getFileContent(fromFileNamed: "day01")
        } catch {
            print("Failed to read Day01.txt: \(error)")
            fileContent = ""
        }

        // MARK: Get an array for every file lines

        let stringInstructions = StringUtils.splitByNewline(fileContent)

        var dial = Dial.init(range: 0...99, startPosition: 50)

        var zeroAtEndCount = 0
        var zeroCrossesCount = 0
        
        // MARK: Compute position for every line and count 0
        
        for stringInstruction in stringInstructions {
            guard
                let instruction = DialInstruction.init(from: stringInstruction)
            else {
                fatalError("Invalid dial instruction: \(stringInstruction)")
            }

            let result = dial.setPosition(
                direction: instruction.direction,
                steps: instruction.steps
            )

            if result.position == 0 {
                zeroAtEndCount += 1
            }
            
            zeroCrossesCount += result.crossesZero
            
            print("Current position: \(result.position)")

        }

        print("zeroAtEndCount: \(zeroAtEndCount)")
        print("zeroAtEndCount: \(zeroCrossesCount)")
    }

}
