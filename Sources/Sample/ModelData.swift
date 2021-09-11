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
    ///   - decoder: `JSONDecoder`
    /// - Throws: File, data, or decoding error
    /// - Returns: `T`
    static func decode<T>(
        file: ProjectFile,
        decoder: JSONDecoder = .sample
    ) throws -> T where T: Decodable {
        let url = try Bundle.main.urlOrThrow(for: file)
        let data = try Data(contentsOf: url)
        return try decoder.decode(T.self, from: data)
    }
}

// MARK: - JSONDecoder + Sample

private extension JSONDecoder {

    /// `JSONDecoder` default for sample data
    static var sample: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
