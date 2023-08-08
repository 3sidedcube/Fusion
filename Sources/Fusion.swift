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
    var models: [String: any FusionModel.Type] = [
        "View": FusionView.self,
        "Text": FusionText.self,
        "Image": FusionImage.self,
        "Stack": FusionStack.self,
        "Scroll": FusionScroll.self,
        "Screen": FusionScreen.self
    ]

    /// Registration of type identifiers to decodable models to modify a view
    var actions: [String: any FusionAction.Type] = [
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
    /// - Parameter json: `ModelJSON`
    /// - Returns: `DecodableView`
    private func model(for json: ModelJSON) throws -> any FusionModel {
        let type = try json[typeKey].string ?! FusionError.type
        let model = try models[type] ?! FusionError.model(type: type)
        return try decode(model, from: json.rawData())
    }

    /// Get any `View` for `json`.
    /// - Parameter json: `ModelJSON`
    /// - Returns: `View`
    func view(for json: ModelJSON) throws -> any View {
        try logOnThrow {
            try model(for: json)
        }
    }

    // MARK: - Actions

    /// Map `JSON` to a `DecodableViewModifier`
    /// - Parameter json: `ActionJSON`
    /// - Returns: `DecodableViewModifier`
    private func action(for json: ActionJSON) throws -> any FusionAction {
        let type = try json[typeKey].string ?! FusionError.type
        let model = try actions[type] ?! FusionError.model(type: type)
        return try decode(model, from: json.rawData())
    }

    /// Get any `ViewModifier` for `json`.
    /// - Parameter json: `ActionJSON`
    /// - Returns: `View`
    func viewModifier(for json: ActionJSON) throws -> any ViewModifier {
        try logOnThrow {
            try action(for: json)
        }
    }

    // MARK: - Logging

    /// Try `operation`, if it throws log the error and throw on
    /// - Parameter operation: Block of code to run
    /// - Returns: Return type of the given `operation`
    private func logOnThrow<T>(operation: () throws -> T) throws -> T {
        do {
            return try operation()
        } catch {
            log("Error decoding model: \(error)")
            throw error
        }
    }

    /// Log a message if logging is enabled
    /// - Parameter message: `String`
    func log(_ message: String) {
        guard isLoggingEnabled else { return }
        print("[\(Fusion.self)] \(message)")
    }

    // MARK: - Actions

    /// Handle a native action
    /// - Parameter nativeAction: `String` the native action
    /// - Returns: `Bool` was the native action handled
    func handle(nativeAction: String) -> Bool {
        false
    }

    /// Handle a screen event
    /// - Parameter screenEvent: `String` the screen event
    /// - Returns: `Bool` was the screen event handled
    func handle(screenEvent: String) -> Bool {
        false
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
