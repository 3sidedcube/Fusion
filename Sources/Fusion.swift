//
//  Fusion.swift
//  Fusion
//
//  Created by Ben Shutt on 02/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import SwiftyJSON
import CubeFoundation

/// Manage the registered models and map them to views
@MainActor struct Fusion {

    /// Shared singleton `Fusion` instance
    static var shared = Fusion()

    /// `JSONDecoder` to use for decoding models from JSON
    var jsonDecoder: JSONDecoder = .default

    /// Registration of types to decodable models to render as a view
    var models: [String: any JSONModel.Type] = [
        "View": FusionView.self,
        "Text": FusionText.self,
        "Image": FusionImage.self
    ]

    /// Map `JSON` to a `JSONModel`
    /// - Parameter json: `JSON`
    /// - Returns: `JSONModel`
    private func jsonModel(from json: JSON) throws -> any JSONModel {
        let type = try json["type"].string ?! FusionError.type
        let model = try models[type] ?! FusionError.model(type: type)
        return try jsonDecoder.decode(model, from: json.rawData())
    }

    /// Get `View` for `json`
    /// - Parameter json: `JSON`
    /// - Returns: `View`
    func view(for json: JSON) -> any View {
        do {
            return try jsonModel(from: json)
        } catch {
            logError(error)
            return EmptyView()
        }
    }

    /// Failed to load a view from JSON due to `error`
    /// - Parameter error: `Error`
    func logError(_ error: Error) {
        print("\(Fusion.self) error loading JSON: \(error)")
    }
}

// MARK: - FusionError

/// An `Error` in `Fusion`
enum FusionError: Error {

    /// Failed to find the type of model to decode
    case type

    /// Failed to find a registered JSON model for the given type
    case model(type: String)
}
