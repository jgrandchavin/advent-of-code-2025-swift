//
//  main.swift
//  AdventOfCode2025Swift
//
//  Created by Ju on 03/12/2025.
//

import Foundation


// MARK: Parse CLI arguments

let args = CommandLine.arguments

guard args.count > 1, let day = Int(args[1]) else {
    print("Usage: swift run AdventOfCode2025 <dayNumber>")
    exit(1)
}

// MARK: Days to run

switch day {
case 1: Day01.run()
default: print("🔴 Day \(day) not implemented yet.")
}
