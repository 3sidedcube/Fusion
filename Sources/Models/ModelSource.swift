//
//  ModelSource.swift
//  Fusion
//
//  Created by Ben Shutt on 11/09/2021.
//

import Foundation

/// A model or that model's source.
///
/// Often a screen is created with either:
/// - the source to fetch the model (which might require fetching from the API)
/// - the model itself
///
/// So this enum is often used as a configuration/state of the screen
public enum ModelSource<Source, Model> {

    /// The source model
    case source(Source)

    /// The model itself
    case model(Model)
}

// MARK: - Extensions

extension ModelSource {

    /// Get associated value for the `.source` case
    var source: Source? {
        guard case .source(let source) = self else { return nil }
        return source
    }

    /// Get associated value for the `.model` case
    var model: Model? {
        guard case .model(let model) = self else { return nil }
        return model
    }
}
