//
//  Decodable+Previews.swift
//  Fusion
//
//  Created by Ben Shutt on 03/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

// Strictly internal. Consider adding to SPM target:
// exclude: ["Extensions/JSONModel+Previews.swift"]

/// Add preview logic to JSON models
extension Decodable where Self: View {

    /// Name of the JSON file without the path extension in the sample directory
    typealias JSONFile = String

    /// Get the `URL` to `file`
    /// - Parameter file: `JSONFile`
    /// - Returns: `URL`
    static func url(for file: JSONFile) throws -> URL {
        try URL.packageDirectory
            .appending(path: "Tests")
            .appending(path: "JSONs")
            .appending(path: file)
            .appendingPathExtension("json")
    }

    /// Decode this model from the given `file`
    /// - Parameter file: `JSONFile`
    /// - Returns: `Self`
    @MainActor static func decode(from file: JSONFile) throws -> Self {
        try Fusion.shared.jsonDecoder.decode(
            Self.self,
            from: Data(contentsOf: url(for: file))
        )
    }

    /// Decode this model from the given `file` for previewing, fatal erroring on throw
    /// - Parameter file: `JSONFile`
    /// - Returns: `Self`
    @MainActor static func preview(from file: JSONFile) -> Self {
        do {
            return try decode(from: file)
        } catch {
            fatalError("Failed to load \(Self.self) from \(JSONFile.self) '\(file)' - \(error)")
        }
    }
}

// MARK: - URL + Package

private extension URL {

    /// Find directory containing the `"Package.swift"` file
    static var packageDirectory: URL {
        get throws {
            var url = URL(fileURLWithPath: #file)
            while url.pathComponents.count > 1 {
                url.deleteLastPathComponent()
                if try url.isPackageDirectory() {
                    return url
                }
            }

            throw FileError.fileNotFound
        }
    }

    /// Does this directory contain the `"Package.swift"` file by checking the last path component
    private func isPackageDirectory() throws -> Bool {
        try FileManager.default.contentsOfDirectory(
            at: self,
            includingPropertiesForKeys: nil,
            options: [.skipsHiddenFiles]
        )
        .contains { url in
            url.lastPathComponent == "Package.swift"
        }
    }
}

// MARK: - FileError

/// `Error` with a file `URL`
enum FileError: Error {

    /// The file does not exist
    case fileNotFound
}
