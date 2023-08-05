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

    /// JSON key for the type of the entity
    var typeKey = "type"

    /// `JSONDecoder` to use for decoding models from JSON
    var jsonDecoder: JSONDecoder = .default

    /// Should log when an error is thrown
    var isLoggingEnabled = false

    /// Registration of type identifiers to decodable models to render as a view
    var models: [String: any DecodableView.Type] = [
        "View": FusionView.self,
        "Text": FusionText.self,
        "Image": FusionImage.self,
        "Stack": FusionStack.self,
        "Scroll": FusionScroll.self
    ]

    /// Registration of type identifiers to decodable models to modify a view
    var actions: [String: any DecodableViewModifier.Type] = [
        "Page": PageAction.self,
        "Link": LinkAction.self,
        "Native": NativeAction.self
    ]

    // MARK: - Decode

    /// Decode `data` into `Model`
    /// - Parameters:
    ///   - type: The `Model` type
    ///   - data: The `Data` to decode
    func decode<Model: Decodable>(
        _ type: Model.Type,
        from data: Data
    ) throws -> Model {
        try jsonDecoder.decode(type, from: data)
    }

    // MARK: - Models

    /// Map `JSON` to a `DecodableView`
    /// - Parameter json: `JSON`
    /// - Returns: `DecodableView`
    private func model(for json: ModelJSON) throws -> any DecodableView {
        let type = try json[typeKey].string ?! FusionError.type
        let model = try models[type] ?! FusionError.model(type: type)
        return try decode(model, from: json.rawData())
    }

    /// Get any `View` for `json`.
    /// - Parameter json: `JSON`
    /// - Returns: `View`
    func view(for json: ModelJSON) throws -> any View {
        try logOnError {
            try model(for: json)
        }
    }

    // MARK: - Actions

    /// Map `JSON` to a `DecodableViewModifier`
    /// - Parameter json: `JSON`
    /// - Returns: `DecodableViewModifier`
    private func action(for json: ActionJSON) throws -> any DecodableViewModifier {
        let type = try json[typeKey].string ?! FusionError.type
        let model = try actions[type] ?! FusionError.model(type: type)
        return try decode(model, from: json.rawData())
    }

    /// Get any `ViewModifier` for `json`.
    /// - Parameter json: `JSON`
    /// - Returns: `View`
    func viewModifier(for json: ActionJSON) throws -> any ViewModifier {
        try logOnError {
            try action(for: json)
        }
    }

    // MARK: - Logging

    /// Try `operation`, if it throws log the error and throw on
    /// - Parameter operation: Block of code to run
    /// - Returns: Return type of `operation`
    private func logOnError<T>(operation: () throws -> T) throws -> T {
        do {
            return try operation()
        } catch {
            log(error: error)
            throw error
        }
    }

    /// Failed to load a view from JSON due to `error`
    /// - Parameter error: `Error`
    func log(error: Error) {
        guard isLoggingEnabled else { return }
        print("[\(Fusion.self)] Error decoding model: \(error)")
    }

    // MARK: - Actions

    /// Handle a native action with `id` from `view`
    /// - Parameters:
    ///   - id: `String`
    ///   - view: `Content`
    func handleNativeAction<Content: View>(id: String, from view: Content) {
        // TODO
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
