//
//  Direction.swift
//  AdventOfCode2025
//
//  Created by Ju on 03/12/2025.
//

enum Direction {
    case left
    case right

    /// Parses a single-character string into a Direction ("L" or "R", case-insensitive).
    /// Returns nil for invalid or multi-character inputs.
    init?(from string: String) {
        guard string.count == 1 else { return nil }
        switch string.uppercased() {
        case "L": self = .left
        case "R": self = .right
        default: return nil
        }
    }
}
