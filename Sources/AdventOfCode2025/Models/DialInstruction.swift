//
//  DialInstruction.swift
//  AdventOfCode2025
//
//  Created by Ju on 04/12/2025.
//

struct DialInstruction {
    let direction: Direction
    let steps: Int
    
    /// Parses a single instruction from a string.
    /// Accepts formats like: "L3", "R 10", " l  2 ".
    /// Returns nil for invalid inputs (missing direction, non-numeric steps, negative steps).
    init?(from string: String) {
        let trimmed = string.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return nil }
        
        // First non-whitespace character should be direction
        guard let firstChar = trimmed.first else { return nil }
        let dirString = String(firstChar)
        guard let direction = Direction(from: dirString) else { return nil }
        
        // The rest should be an integer (allow surrounding spaces)
        let remainder = trimmed.dropFirst().trimmingCharacters(in: .whitespaces)
        guard let steps = Int(remainder), steps >= 0 else { return nil }
        
        self.direction = direction
        self.steps = steps
    }
}
