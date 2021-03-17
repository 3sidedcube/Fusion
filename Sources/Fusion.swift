//
//  Fusion.swift
//  Fusion
//
//  Created by Ben Shutt on 03/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import UIKit
import HTTPRequest
import Alamofire
import OSLog

/// Overridable configuration properties.
///
/// Referencing apps can set the shared `static` singleton instance to define
/// their own `Fusion` instance. E.g. subclassing and overriding with a bespoke implementation.
open class Fusion: ActionHandler {

    /// `Fusion` shared `static` singleton instance
    public static var shared = Fusion()

    // MARK: - Init

    /// Default initializer
    public init() {
    }

    // MARK: - Logging

    /// Are `OSLog`s enabled
    open var isLoggingEnabled: Bool {
        return false
    }

    /// Log an error with the given `message`
    ///
    /// - Parameters:
    ///   - type: `OSLogType`
    ///   - message: `String`
    @discardableResult
    open func log(type: OSLogType, message: String) -> Bool {
        guard isLoggingEnabled else { return false }
        os_log(type, log: .logger, "%@", message)
        return true
    }

    // MARK: - Codable

    /// `JSONDecoder` to use for JSON decoding
    open var jsonDecoder: JSONDecoder {
        return JSONDecoder.snakeCase
    }

    /// `JSONEncoder` to use for JSON encoding
    open var jsonEncoder: JSONEncoder {
        return JSONEncoder.snakeCase
    }

    // MARK: - JSONModel

    /// `JSONModel`s to dynamically decode from `JSON`
    open var jsonModelTypes: [JSONModel.Type] {
        return [
            Text.self,
            Image.self,
            Button.self,
            Divider.self,
            ListItem.self,
            Bullet.self,
            BulletGroup.self
        ]
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

    // MARK: - HTTPRequest

    /// Create a `HTTPRequest` for fetching a `Page` at the given `pageURL`
    ///
    /// - Parameter pageURL: `URL` to fetch `Page` from
    open func httpRequestForPageURL(_ pageURL: URL) throws -> HTTPRequest {
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

    /// Handle the given `action`.
    /// By default, do not handle the `action` in preference of the default behavior.
    ///
    /// - Parameter action: `Action`
    /// - Returns: Return `false` by default (i.e. does not handle the `action`)
    open func handleAction(_ action: Action) -> Bool {
        return false
    }

    // MARK: - Row

    /// Message sent when the `row` finished configuring
    ///
    /// - Parameters:
    ///   - row: `FusionRow<T>`
    ///   - cell: `T` is a `UITableViewCell`
    open func rowDidConfigure<T>(
        _ row: FusionRow<T>,
        cell: T
    ) where T: UITableViewCell {
        // Subclasses can override
    }

    /// Message sent when the `row` finished "willDisplay"
    ///
    /// - Parameters:
    ///   - row: `FusionRow<T>`
    ///   - cell: `T` is a `UITableViewCell`
    open func rowWillDisplay<T>(
        _ row: FusionRow<T>,
        cell: T
    ) where T: UITableViewCell {
        // Subclasses can override
    }
}

// MARK: - FusionError

/// An `Error` in `Fusion`
public enum FusionError: Error {

    /// Failed to create `URLComponents` from the given `URL`
    case invalidURL(URL)
}
