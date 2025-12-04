//
//  FileParser.swift
//  AdventOfCode2025
//
//  Created by Ju on 03/12/2025.
//

import Foundation


enum FileParserError: Error {
    case fileNotFound(name: String)
    case unreadableFile(name: String, error: Error)
}

/// A small utility for loading and parsing text files bundled with the app.
struct FileParser {
    /// Reads a text resource from the app bundle and returns its full contents as a `String`.
    ///
    /// - Parameters:
    ///   - fileName: The resource name without extension (for example, "input").
    ///   - ext: The file extension of the resource. Defaults to `"txt"`.
    /// - Returns: The full textual contents of the resource file.
    /// - Throws: `FileParserError.fileNotFound` if the resource cannot be located in the bundle, or
    ///           `FileParserError.unreadableFile` if the resource exists but cannot be read.
    static func getFileContent(
        fromFileNamed fileName: String,
        ext: String = "txt"
    ) throws -> String {

        // Get the file url
        guard
            let url = Bundle.module.url(
                forResource: fileName,
                withExtension: ext
            )
        else {
            throw FileParserError.fileNotFound(name: fileName)
        }
        
        // Try to read the file
        do {
            return try String(contentsOf: url)
        } catch {
            throw FileParserError.unreadableFile(name: fileName, error: error)
        }
    }
}


