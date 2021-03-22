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
import ThunderTable

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

    // MARK: - Configuration

    /// Add pull to refresh functionality to the `PageViewController`
    open var pullPageToRefresh: Bool {
        return false
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
        return try HTTPRequest(
            method: .get,
            urlComponents: pageURL.toURLComponents(),
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
        if let nativeAction = action as? NativeAction {
            return handleNativeAction(nativeAction)
        }
        return false
    }

    /// Handle the given `nativeAction`.
    ///
    /// - Note:
    /// This method is explicitly provided (opposed to the other `Action`s) because, by definition,
    /// it should be handled by the app.
    ///
    /// - Parameter nativeAction: `NativeAction`
    open func handleNativeAction(_ nativeAction: NativeAction) -> Bool {
        return false
    }

    // MARK: - Row

    /// Override the `Row` which is returned for the given `model`.
    ///
    /// - Warning:
    /// This method is often not what you need, other more common alternatives include:
    ///   - Create your own `JSONModel`
    ///   - Update configuration properties on the `Fusion` default `Row` or `UITableViewCell`
    ///
    /// If a new `JSONModel` seems unnecessary and what can be configured on the default is not enough
    /// then use this method.
    ///
    /// - Parameter model: `JSONModel`
    /// - Returns: Returning `nil` doesn't specify an override and will have default behaviour
    open func rowForModel(_ model: JSONModel) -> Row? {
        return nil
    }

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

    // MARK: - UI

    /// Return a `UIImage` for the given `accessoryType`
    ///
    /// As `UITableViewCell` content can be inset with `Margins`, the system provided
    /// `accessoryView` is often not what we want. Instead, a `UITableViewCell` could
    /// conform to `MappedAccessoryType` to say that it will handle the `accessoryType` inline
    /// with its own design.
    ///
    /// - Parameter accessoryType: `UITableViewCell.AccessoryType`
    open func imageForAccessoryType(
        _ accessoryType: UITableViewCell.AccessoryType
    ) -> UIImage? {
        return nil
    }
}
