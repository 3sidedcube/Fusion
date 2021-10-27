//
//  Fusion.swift
//  Fusion
//
//  Created by Ben Shutt on 03/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import Alamofire
import OSLog
import SwiftUI

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

    // MARK: - JSONModel

    /// `JSONModel`s to dynamically decode from `JSON`
    open var jsonModelTypes: [JSONModel.Type] {
        return [
            BulletGroupModel.self,
            BulletModel.self,
            ButtonModel.self,
            DividerModel.self,
            ImageModel.self,
            ListItemModel.self,
            TextModel.self
        ]
    }

    /// `Action`s to dynamically decode from `JSON`
    open var actionTypes: [Action.Type] {
        return [
            EmailAction.self,
            LinkAction.self,
            NativeAction.self,
            PageAction.self
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
        guard let nativeAction = action as? NativeAction else { return false }
        return handleNativeAction(nativeAction)
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

    // MARK: - View

    /// Override the `FusionView` which is returned for the given `model`.
    ///
    /// - Warning:
    /// More often than not it's preferable to simply create your own `JSONModel`.
    /// If a new `JSONModel` seems unnecessary and what can be configured on the default is not enough
    /// then use this method.
    ///
    /// - Parameter model: `JSONModel`
    /// - Returns: `FusionView`
    open func view(for model: JSONModel) -> some FusionView {
        if model is FusionView {
            return model
        }
        if let fusionView = model as? FusionView {
            return fusionView
        }
    }

    // MARK: - Page

    /// Create a `PageViewController` instance with the given `configuration`
    ///
    /// - Parameter configuration: `ModelSource<URL, Page>`
    open func createPageViewController(
        state: ModelSource<URL, Page>
    ) -> PageViewController {
        // Return a `PageViewController`, subclasses may provide their own instance
        return PageViewController(state: state)
    }
}
