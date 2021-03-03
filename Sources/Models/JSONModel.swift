//
//  JSONModel.swift
//  Fusion
//
//  Created by Ben Shutt on 03/03/2021.
//  Copyright © 2021 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation
import SwiftyJSON

/// A `JSONModel` is a dynamically instantiated entity created from a (`SwiftyJSON`) `JSON`.
///
/// It is identified by the `classIdentifier`, if this matches, then the `JSONModel` will
/// instantiate itself from the `JSON`
public protocol JSONModel {

    /// Define the "class" which uniquely identifies this `JSONModel`.
    ///
    /// If this `classIdentifier` matches the `class` of the `JSON`, then the `JSON`
    /// will be used to instantiate this `JSONModel`.
    static var classIdentifier: String { get }

    /// Instantiate `JSONModel` instance from the given `json`
    ///
    /// - Parameter json: `JSON`
    /// - Returns `nil` if the `JSONModel` shouldn't be instantiated
    /// - throws: If the `JSONModel` should be instantiated but failed to be
    init?(json: JSON) throws
}

// MARK: - JSONModel + Defaults

public extension JSONModel {

    /// By default the identifier is the name of the type
    static var classIdentifier: String {
        return "\(Self.self)"
    }
}

// MARK: - JSONModel + Decodable

public extension JSONModel where Self: Decodable {

    /// Check `class` in `json` matches `classIdentifier`.
    /// If so, instantiate from `JSONDecoder`
    ///
    /// - Parameter json: `JSON`
    /// - Returns `nil` if the `JSONModel` shouldn't be instantiated
    init?(json: JSON) throws {
        guard Self.classIdentifier == json["class"].string else { return nil }
        let jsonDecoder = Fusion.shared.jsonDecoder
        self = try jsonDecoder.decode(Self.self, from: json.rawData())
    }
}
