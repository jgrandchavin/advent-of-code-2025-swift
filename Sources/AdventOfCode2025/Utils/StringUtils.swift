/// String utilities for AdventOfCode2025.
///
/// This file contains small, focused helpers for working with strings in
/// Advent of Code solutions. Prefer adding pure, reusable functions here
/// rather than scattering ad-hoc string logic across days.
//

//
//  StringUtils.swift
//  AdventOfCode2025
//
//  Created by Ju on 03/12/2025.
//

/// A namespace for common string helper functions used throughout the
/// AdventOfCode2025 project.
struct StringUtils {
    
    /// Splits a string into lines by the newline character ("\n").
    ///
    /// - Parameter input: The input string to split.
    /// - Returns: An array of lines, excluding empty trailing segments created by a final newline.
    ///
    /// This method uses `String.split(separator:)`, which omits empty subsequences.
    /// If you need to preserve empty lines, consider using a different approach
    /// such as `components(separatedBy:)`.
    static func splitByNewline(_ input: String) -> [String] {
        input.split(separator: "\n").map(String.init)
    }
    
}
