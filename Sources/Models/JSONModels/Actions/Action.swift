//
//  Action.swift
//  CBIT
//
//  Created by Ben Shutt on 12/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftyJSON

/// An `Action` represents pre-defined logic which will execute in the app.
/// Due to their dynamic nature, they are instantiated as a `JSONModel`.
public protocol Action: Codable, JSONModel {}

/// `JSON` which defines an `Action`
public typealias ActionJSON = JSON

// MARK: - JSON + Action

public extension JSON {

    /// Load the corresponding `Action` from this `JSON` instance
    func toAction() throws -> Action? {
        return try Fusion.shared.actionTypes
            .compactMap { try $0.init(json: self) }
            .first
    }
}
