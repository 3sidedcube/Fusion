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
    var models: [String: any DecodableView.Type] = [
        "View": FusionView.self,
        "Text": FusionText.self,
        "Image": FusionImage.self,
        "Stack": FusionStack.self
    ]

    /// Map `JSON` to a `DecodableView`
    /// - Parameter json: `JSON`
    /// - Returns: `DecodableView`
    private func jsonModel(from json: JSON) throws -> any DecodableView {
        let type = try json["type"].string ?! FusionError.type
        let model = try models[type] ?! FusionError.model(type: type)
        return try jsonDecoder.decode(model, from: json.rawData())
    }

    /// Get any `View` for `json`.
    /// - Note: Errors that are thrown are caught and the method returns `EmptyView`.
    /// - Parameter json: `JSON`
    /// - Returns: `View`
    private func view(for json: JSON) -> any View {
        do {
            return try jsonModel(from: json)
        } catch {
            logError(error)
            return EmptyView()
        }
    }

    /// Get `View` for `json`
    /// - Parameter json: `JSON`
    /// - Returns: `View`
    func erasedView(for json: JSON) -> AnyView {
        AnyView(erasing: Fusion.shared.view(for: json))
    }

    /// Failed to load a view from JSON due to `error`
    /// - Parameter error: `Error`
    func logError(_ error: Error) {
        print("[\(Fusion.self)] Error loading JSON model: \(error)")
    }

    // MARK: - Actions

    /// Handle the given `action`
    /// - Parameters:
    ///   - action: `JSON`
    ///   - view: `Content`
    func handle<Content: View>(action: JSON, from view: Content) {
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
