//
//  NativeAction.swift
//  CBIT
//
//  Created by Ben Shutt on 16/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// The `Action` should be handled natively defined by a `link`.
public struct NativeAction: Codable, Action {

    /// Unique link to define a native action
    /// E.g. `app://native-action-identifier`
    public var link: String?
}

// MARK: - Extensions

public extension NativeAction {

    /// Scheme (prefix) identifying the link as a `NativeAction`
    static let appLinkScheme = "app://"

    /// Map `link` to `String` identifier with scheme removed
    var identifier: String? {
        let prefix = Self.appLinkScheme
        guard let link = link, link.hasPrefix(prefix) else { return nil }
        return String(link.dropFirst(prefix.count))
    }
}
