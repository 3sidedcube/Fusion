//
//  Fusion.swift
//  Fusion
//
//  Created by Ben Shutt on 03/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import HTTPRequest
import Alamofire

/// Overridable configuration properties.
///
/// Referencing apps can set the shared `static` singleton instance to define
/// their own `Fusion` instance. E.g. subclassing and overriding with a bespoke implementation.
open class Fusion: ActionHandler {

    /// `Fusion` shared `static` singleton instance
    public static var shared = Fusion()

    /// `JSONDecoder` to use for JSON decoding
    open var jsonDecoder: JSONDecoder {
        return JSONDecoder.snakeCase
    }

    /// `JSONEncoder` to use for JSON encoding
    open var jsonEncoder: JSONEncoder {
        return JSONEncoder.snakeCase
    }

    /// `JSONModel`s to dynamically decode from `JSON`
    open var jsonModelTypes: [JSONModel.Type] {
        return []
    }

    /// `Action`s to dynamically decode from `JSON`
    open var actionTypes: [Action.Type] {
        return [
            PageAction.self,
            LinkAction.self,
            NativeAction.self,
            EmailAction.self
        ]
    }

    /// Create a `HTTPRequest` for fetching a `Page`
    /// - Parameter pageURL: `URL` to fetch `Page` from
    open func pageHttpRequest(for pageURL: URL) throws -> HTTPRequest {
        // Create `URLComponents` from `URL` by resolving against the base URL
        guard let urlComponents = URLComponents(
            url: pageURL,
            resolvingAgainstBaseURL: true
        ) else {
            throw FusionError.invalidURL(pageURL)
        }

        // Create `HTTPRequest`
        return HTTPRequest(
            method: .get,
            urlComponents: urlComponents,
            additionalHeaders: HTTPHeaders([.acceptJSON])
        )
    }

    // MARK: - ActionHandler

    /// Handle the given `action`
    /// - Parameter action: `Action`
    /// - Returns: Return `false` by default (i.e. does not handle the `action`)
    open func handleAction(_ action: Action) -> Bool {
        return false
    }
}

// MARK: - FusionError

/// An `Error` in `Fusion`
public enum FusionError: Error {

    /// Failed to create `URLComponents` from the given `URL`
    case invalidURL(URL)
}
