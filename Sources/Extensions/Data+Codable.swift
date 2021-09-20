//
//  Data+Codable.swift
//  Fusion
//
//  Created by Ben Shutt on 05/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import HTTPRequest

// MARK: - Data + Codable

extension Data {

    /// Decode this JSON `Data` into `T` with `jsonDecoder`. Otherwise throw.
    ///
    /// - Parameter jsonDecoder: `JSONDecoder`
    func decode<T>(
        with jsonDecoder: JSONDecoder = Fusion.shared.jsonDecoder
    ) throws -> T where T: Decodable {
        do {
            return try jsonDecoder.decode(T.self, from: self)
        } catch {
            let message = "[\(Self.self)] \(#function) \(error)"
            Fusion.shared.log(type: .error, message: message)
            throw error
        }
    }
}

// MARK: - Result + APIModel

extension Result where Success == Data {

    /// Try `decode()` on `data` of `successOrThrow()`
    func toApiModel<T>() throws -> APIModel<T> where T: Decodable {
        return try successOrThrow().decode()
    }

    /// Capture `toApiModel()` in a `ModelResult`
    func toModelResult<T>() -> ModelResult<T> where T: Codable {
        return .init({ try toApiModel().data })
    }
}
