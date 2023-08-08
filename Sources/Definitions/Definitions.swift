//
//  Definitions.swift
//  Fusion
//
//  Created by Ben Shutt on 01/08/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import SwiftyJSON
import CubeFoundationSwiftUI

/// Shorthand for model conformance
public typealias Model = Equatable & Hashable & Codable

/// A hex string of the form `#RRGGBBAA`
public typealias RGBAHex = Color.RGBAHex

/// Denotes a `JSON` which represents an view
public typealias ModelJSON = JSON

/// Denotes a `JSON` which represents an action
public typealias ActionJSON = JSON

/// A `JSON` array
public typealias JSONArray = [JSON]
