//
//  ModelData.swift
//  Fusion
//
//  Created by Ben Shutt on 10/09/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// Load model data
struct ModelData {

    /// Decode a new instance of `T`
    ///
    /// - Parameters:
    ///   - file: `ProjectFile`
    ///   
    /// - Throws: File, data, or decoding error
    /// - Returns: `T`
    static func decode<T>(file: ProjectFile) throws -> T where T: Decodable {
        let url = try Bundle.main.urlOrThrow(for: file)
        let data = try Data(contentsOf: url)
        return try data.decode()
    }
}
