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

    /// Mapping of type keys to decodable view-models to render
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
            print("\(Fusion.self) error loading JSON: \(error)")
            return EmptyView()
        }
    }
}

// MARK: - FusionError

/// An `Error` in `Fusion`
enum FusionError: Error {

    /// Failed to find the type of model to decode
    case type

    /// Failed to find a corresponding `JSONModel` for the given type
    case model(type: String)
}
