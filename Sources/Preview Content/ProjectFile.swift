//
//  ProjectFile.swift
//  Fusion
//
//  Created by Ben Shutt on 10/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// A file in the app project.
struct ProjectFile {

    /// Name of the file/resource
    var fileName: String

    /// Extension of the file/resource
    var fileExtension: String
}

// MARK: - Bundle + ProjectFile

extension Bundle {

    /// Get the `URL` for the given `file`
    ///
    /// - Parameter file: `ProjectFile`
    /// - Returns: `URL`
    func url(for file: ProjectFile) -> URL? {
        return url(
            forResource: file.fileName,
            withExtension: file.fileExtension
        )
    }

    /// Get the `URL` for the given `file` or `throw`
    ///
    /// - Parameter file: `ProjectFile`
    /// - Throws: `ProjectFileError`
    /// - Returns: `URL`
    func urlOrThrow(for file: ProjectFile) throws -> URL {
        guard let url = url(for: file) else {
            throw ProjectFileError.fileNotFound(file)
        }
        return url
    }
}

// MARK: - ProjectFileError

/// An `Error` when working with `ProjectFile`
enum ProjectFileError: Error {

    /// Failed to find the `URL` of the `projectFile` in the project
    case fileNotFound(_ projectFile: ProjectFile)
}
